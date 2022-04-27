import os
from os import path
path.join('../data/')
def convert16to10(width,data):
   # width 16进制数所占二进制位数

  dec_data=int(data, 16)
  #print(dec_data)
  if dec_data > 2 ** (width-1)- 1:
      dec_data = 2 ** width-dec_data
      dec_data=0-dec_data
  return(dec_data/2 ** (width/2))

def process(width):
  print(os.listdir())
  f = open("./data/s_pb_1.txt",encoding='utf-8')
  with open('./data/s_pb_1_after_pe.txt','w',encoding='utf-8') as f1:
     while True:
        line = f.readline()
        if line:
          # print (line)
            # data_pre=bin(int(data))[2:]
            data_pre=convert16to10(width,line)
            # print('line',line,'data_pre',data_pre)
            f1.write(str(data_pre)+'\n')
          # arr[0],'arr[0]',arr[1],'arr[1]')
        else:
          break
  f.close()
  f1.close()
process(32)