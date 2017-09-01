
import jieba
from wordcloud import WordCloud
from scipy.misc import imread
from os import path
import codecs
import re
import matplotlib.pyplot as plt


# 绘制词云
# pic_path 为词云背景图片地址
# singer_name 为 False 时，则读取歌曲评论文件，否则读取歌手热评文件
def draw_word_cloud(pic_path="timg.jpg"):
    comments_list = get_comments_list('pulls.txt')

    comments_text = "".join(comments_list)
    # noinspection PyPep8
    cut_text = " ".join(jieba.cut(comments_text))  # 将jieba分词得到的关键词用空格连接成为字符串

    # d = path.dirname(__file__)  # 当前文件文件夹所在目录

    # color_mask = imread(pic_path)  # 读取背景图片
    #
    # cloud = WordCloud(font_path=r'C:/Users/Windows/fonts/simkai.ttf', background_color='white', mask=color_mask,
    #                   max_words=2000, max_font_size=40)
    # word_cloud = cloud.generate(cut_text)  # 产生词云
    wordcloud = WordCloud(random_state=1, font_path=r'C:/Users/Windows/fonts/simkai.ttf', max_font_size=40).generate(cut_text)
    plt.figure()
    plt.imshow(wordcloud, interpolation="bilinear")
    plt.axis("off")
    plt.show()
    # noinspection PyPep8,PyPep8
    # word_cloud.to_file("success.jpg")
    # print('success')

# 得到评论列表
# noinspection PyRedundantParentheses
def get_comments_list(filename):
    with codecs.open(filename, "r", encoding='utf-8') as f:
        lists = f.readlines()
        comments_list = []
        for comment in lists:
            if(re.match(r"^\d.*", comment)):
                try:
                    # noinspection PyPep8,PyPep8
                    comments_list.append(comment.split(" ", 5)[5].replace("\n", ""))
                except Exception as e:
                    print(e)
            else:
                comments_list.append(comment)
    return comments_list
draw_word_cloud()