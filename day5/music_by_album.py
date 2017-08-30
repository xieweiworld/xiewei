"""
根据专辑 ID 获取到所有的音乐 ID
"""
import requests
from bs4 import BeautifulSoup
import time
from day5 import sql

class Music(object):
    # noinspection PyPep8,PyPep8
    headers = {
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate, sdch',
        'Accept-Language': 'zh-CN,zh;q=0.8',
        'Connection': 'keep-alive',
        'Cookie': 'vjuids=5a3b3fa87.15ccf2a85ac.0.58bbbd62abb9d; vjlast=1498124289.1498124289.30; _ntes_nnid=828896474bfbb2dac82d54de7ae8ce53,1498124289473; _ntes_nuid=828896474bfbb2dac82d54de7ae8ce53; __s_=1; vinfo_n_f_l_n3=ca37a9dd42f12434.1.0.1498124289493.0.1498124435459; nteslogger_exit_time=1498124438803; NTES_PASSPORT=lAFEvbelHfTqBSTxb01PiDzSTa4V8V0SWmxVNUYpfXaKJYRBJ0rMWQzmWYnEMvO_9iDY9R4aBkTi462iW.huhONDjlMLVhsBGRhfMQpAwJEKUjSOfG8gpJknFxy9o4fni; P_INFO=xieweiworld@yeah.net|1502935300|1|study|00&99|null&null&null#gud&440300#10#0#0|&0||xieweiworld@yeah.net; JSESSIONID-WYYY=2%2FHytDm%5C61XqSg4Q8lE%2BS36qOhw%2FPJp3P0Q%5CHytd63iGW%5CDKDNbzlmwnZCHvj%5CDuicXFH31gtQUe2n7kWGwZ516RQ1WPNmOl1ZZo6hO2AJNfr92BxJc68PTefdDBu5b%2Fl%2Fyiz%2FJAfeA4%2BposEpSPuHF59Azba9sX6mm66EUoUwf6TxCj%3A1503652393325; _iuqxldmzr_=32; __utma=94650624.862669832.1502437501.1503648854.1503651163.3; __utmb=94650624.53.10.1503651163; __utmc=94650624; __utmz=94650624.1502437501.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)',
        'Host': 'music.163.com',
        'Referer': 'http://music.163.com/',
        'Upgrade-Insecure-Requests': '1',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3226.400 QQBrowser/9.6.11681.400'
    }

    # noinspection PyMethodMayBeStatic,PySingleQuotedDocstring,PySingleQuotedDocstring
    def save_music(self, album_id):
        '''
        保存歌曲
        '''
        # noinspection PyPep8
        params = {'id': album_id}

        # 获取专辑的所有的页面
        r = requests.get('http://music.163.com/album', headers=self.headers, params=params)

        # 网页解析
        soup = BeautifulSoup(r.content.decode(), 'html.parser')
        body = soup.body

        musics = body.find('ul', attrs={'class': 'f-hide'})
        if not musics:
            # 专辑下面没有歌曲的话,直接更新状态
            sql.update_album(album_id)
            return
        musics = musics.find_all('li')
        for music in musics:
            music = music.find('a')
            music_id = music['href'].replace('/song?id=', '')
            music_name = music.getText()
            sql.update_album(album_id)  # 更新专辑表状态,标记已经爬取
            sql.insert_music(music_id, music_name, album_id)

if __name__ == '__main__':
    albums = sql.get_all_album()
    my_music = Music()
    for x in albums:
        try:
            my_music.save_music(x['album_id'])
        except Exception as e:
            print(str(x) + ';' + str(e))

        time.sleep(1)











