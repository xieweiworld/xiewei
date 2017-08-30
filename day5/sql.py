#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# noinspection PySingleQuotedDocstring,PySingleQuotedDocstring
'''
一般是用于连接MySQL的工具:pymysql
'''
import pymysql.cursors

connection = pymysql.connect(host='112.74.77.128',
                             user='root',
                             password='ms12345',
                             db='dev_czy_01',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
# 保存评论
def insert_comments(music_id, comments, detail, connection0):
    with connection0.cursor() as cursor:
        sql = 'INSERT INTO comments (music_id, comments, detail) VALUES (%s, %s, %s)'
        cursor.execute(sql % (music_id, comments, detail))
    connection0.commit()

# 保存音乐
def insert_music(music_id, music_name, album_id):
    with connection.cursor() as cursor:
        sql = "INSERT INTO `musics` (`MUSIC_ID`, `MUSIC_NAME`, `ALBUM_ID`) VALUES (%s, %s, %s)"
        cursor.execute(sql, (music_id, music_name, album_id))
    connection.commit()

# 保存专辑
def insert_album(album_id, artist_id):
    with connection.cursor() as cursor:
        sql = "INSERT INTO `albums` (`ALBUM_ID`, `ARTIST_ID`) VALUES (%s, %s)"
        cursor.execute(sql, (album_id, artist_id))
    connection.commit()

# 更新专辑状态
def update_album(album_id):
    with connection.cursor() as cursor:
        sql = " update `albums` set status = 1 WHERE album_id = (%s)"
        cursor.execute(sql, album_id)
    connection.commit()

# 保存歌手
def insert_artist(artist_id, artist_name):
    with connection.cursor() as cursor:
        sql = "INSERT INTO `artists` (`ARTIST_ID`, `ARTIST_NAME`) VALUES (%s, %s)"
        cursor.execute(sql, (artist_id, artist_name))
    connection.commit()

# 获取所有的歌手id
def get_all_artist():
    with connection.cursor() as cursor:
        sql = 'select artist_id from artists ORDER BY artist_id'
        cursor.execute(sql)
        return cursor.fetchall();

# 获取所有专辑的 ID
def get_all_album():
    with connection.cursor() as cursor:
        sql = "SELECT DISTINCT `album_id` FROM `albums` WHERE status = 0 ORDER BY ALBUM_ID"
        cursor.execute(sql, ())
        return cursor.fetchall()


# 获取所有音乐的 ID
def get_all_music():
    with connection.cursor() as cursor:
        sql = "SELECT `MUSIC_ID` FROM `musics` ORDER BY MUSIC_ID"
        cursor.execute(sql, ())
        return cursor.fetchall()


# 获取前一半音乐的 ID
def get_before_music():
    with connection.cursor() as cursor:
        sql = "SELECT `MUSIC_ID` FROM `musics` ORDER BY MUSIC_ID LIMIT 0, 800000"
        cursor.execute(sql, ())
        return cursor.fetchall()


# 获取后一半音乐的 ID
def get_after_music():
    with connection.cursor() as cursor:
        sql = "SELECT `MUSIC_ID` FROM `musics` ORDER BY MUSIC_ID LIMIT 800000, 1197429"
        cursor.execute(sql, ())
        return cursor.fetchall()


def dis_connect():
    connection.close()





