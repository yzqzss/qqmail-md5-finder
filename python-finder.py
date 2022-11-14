import _thread
import time


thread_num = int(input("开多少个线程:")) # 开多少个线程
target_md5 = input("md5,小写:") # 目标 md5, 小写。

starttime = time.time()
##########

stopFlag = False


def md5finder( str_md5, range_start, range_end, print_process):
    global stopFlag
    from hashlib import md5
    _md5 = md5
    print( "Thread started", range_start, range_end)
    # time.sleep(1)
    sample_hex = bytes.fromhex(str_md5) # binary
    if print_process:
        for i in range(range_start, range_end):
            md5 = _md5(bytes(str(i) + "@qq.com", encoding="ascii")) # binary
            if i%300000 == 0:
                print('Calculating...', (i-range_start)/(range_end-range_start) )
                print(time.time()-starttime)
            if md5.digest() == sample_hex:
                print(i, md5.hexdigest() )
                stopFlag = True
    else:
        for i in range(range_start, range_end):
            md5 = _md5(bytes(str(i) + "@qq.com", encoding="ascii")) # binary
            if md5.digest() == sample_hex:
                print(i, md5.hexdigest() )
                stopFlag = True


range_flag = -1
def gen():#gen_range
    global thread_num
    global range_flag
    if range_flag == -1:
        range_flag+=1
        return range_flag
    else:
        range_flag +=1
        return int(4000000000/thread_num)*range_flag

try:
    last = None
    haha = 1
    while haha != thread_num+1:
        if last == None:
            first = gen()
            last = gen()
            _thread.start_new_thread( md5finder, (target_md5, first, last, True) )
        else:
            first = last
            last = gen()
            _thread.start_new_thread( md5finder, (target_md5, first, last, False) )
        haha+=1
except:
   print ("Error")

while stopFlag == False:
   pass
