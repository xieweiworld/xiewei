<?php
class UploadMallProductDescriptionToQiNiu {
    private $table = 'wmall_product';
    public function __construct(){}

    /**
     * 上传到七牛云并且把模版地址填入商品表
     */
    public function uploadToQiNiu() {
        $products = $this->lists(' wid,id,description');
        if($products){
            define('WID', $products[0]['wid']);
            foreach ($products as $value){
                $res = $this->saveTemplates($value['description']);
                if($res){
                    $fileName = YYUC_FRAME_PATH . 'public_html/' . $value['description'];
                    $qiniuPath = Storage::upload($fileName, 'template');
                    if($qiniuPath){
                        $wmall_product = new Model($this->table);
                        $data = array('description'=>$qiniuPath, 'is_remote'=>1);
                        $condition = array('id'=>$value['id']);
                        $status = $wmall_product->update($condition, $data);
                        if(!$status){
                            Log::error('商品id为' . $value['id'] . '更新失败');
                        }
                    }else{
                        Log::error('商品id为' . $value['id'] . '模版上传失败');
                    }
                }
            }
        }
        
    }

    /**
     * 查出所有的未上传的商品模版
     * @param string $select
     * @return array
     */
    private function lists($select = '*') {
        $sql = "select $select from $this->table where description != '' and is_remote = 0 AND add_date > '2017-01-01' ORDER BY id asc limit 30 ";
        return DB::get_db()->query($sql);
    }

    /**
     * 保存html模版，并且将图片保存在本地
     * @param $filePath
     * @return int
     */
    private function saveTemplates($filePath) {
        $filePath = YYUC_FRAME_PATH.'public_html/'.$filePath;
        $content = file_get_contents($filePath);
        if(!$content){
            return false;
        }
        $content = $this->htmlRemoteImageToLocal($content);
        $result = file_put_contents($filePath, $content);
        return $result;
    }
    /**Url的资源后缀名
     * @param $url
     * @return mixed
     */
    public function getUrlExt($url) {
        $arr = parse_url($url);
        $file = basename($arr['path']);
        $ext = explode(".",$file);
        return $ext[1];
    }

    /**远程图片转存到本地和七牛存储空间
     * @param $content
     * @return mixed
     */
    public function htmlRemoteImageToLocal($content){
        //正则匹配出所有img
        preg_match_all('/<img .*?src=[\'"]([^<>]*?)[\'"]/i',$content,$match);
        //img-src下载在本地
        if(is_array($match[1])){//存在img
            $arr = array();
            $flag = false;
            foreach ($match[1] as $v){
                $flag = true;
                $ext = $this->getUrlExt($v);
                if($ext)
                    $ext = '.'.$ext;
                $filePath = YYUC_FRAME_PATH . 'public_html/upload/editor/gather/';
                if(!file_exists($filePath))
                    mkdir($filePath,0777,true);
                $v1 = $v;
                if (substr($v,0,1) == '/'){
                    $v1 = SITE.$v;
                }
                $file = file_get_contents($v1);
                if($file){
                    $fileName = $filePath.get_unique_code().$ext;
                    file_put_contents($fileName, $file);
                    $fileName = Storage::upload($fileName,'productPic');
                }else{
                    $fileName = '';
                }
                $arr[$v] = $fileName;
            }
            if($flag){
                //本地url替换img-src
                foreach ($arr as $k => $v){
                    $v = Storage::getUrl($v);
                    $content = str_replace('src="'.$k, 'src="'.$v , $content);
                }
            }
        }
        return $content;
    }
}
