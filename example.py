# example.py
from videocr import get_subtitles

if __name__ == '__main__':  # This check is mandatory for Windows.
    videoPath = '/tv/The Boys/Season 1'
    videoFileName = 'The.Boys.S01E01.720p.BluRay.HebSubs.x264-REWARD.mkv'
    videoFile = videoPath + videoFileName
    print(get_subtitles(videoFile, lang='chi_sim+eng', sim_threshold=70, conf_threshold=65))