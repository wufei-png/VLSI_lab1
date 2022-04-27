from decimal import *
def qvfan(x):
  result=''
  for index,data in enumerate(x[:]):
    if x[index]=='0':
      result+='1'
    elif x[index]=='1':
      result+='0'
    else :
      print('error')
      return
  #print(result)
  return result
def buma(x):
  x=qvfan(x)
  result=''
  if x[-1]==0:
    c=0
    result='1'+result
  else :
    c=1
    result='0'+result

  for index,data in enumerate(x[-2::-1]):
    # print(index)
    tmp=''
    if c==0:
      if data=='0':
        tmp='0'
        c=0
      elif data=='1':
        tmp='1'
        c=0
    if c==1:
      if data=='0':
        tmp='1'
        c=0
      elif data=='1':
        tmp='0'
        c=1
    result=tmp+result
  #print(result)
  return result
def str2bin(x,max_bits):
  '''Transforms an str(actual a float) with a dot into a binary float with a dot'''
  # print('float.fromhex(x)',float.fromhex(x))
  e_flag=0
  sign_flag=0
  if(x[0]=='-'):
    sign_flag=1
    x=x[1:]#先都按正数处理
  if('e' in x):#有e
    a='0'*8
    p=x
    e_flag=1
  else:
    a,_,p = x.partition('.')#没有e，但是不一定有小数点
  # print('a',a)
  # the following part transforms the part after the dot into a binary after the dot

  tinies = [ Decimal(1) / Decimal(2**i) for i in range(1,max_bits+1)]

  bits = []
  if(p==''):#整数，没有小数点
    #print('null')
    pbin='0'*max_bits
  else:
    if(e_flag):
      pdec = Decimal(p)
    else:
      pdec = Decimal('.'+p)
    #print('pdec',pdec)
    for tin in tinies:
      #print('tin',tin)
      if pdec-tin==0:

        bits.append('1')
        print('bit',bits)
        break

      elif pdec-tin>0:

        bits.append('1')

        pdec -= tin

      else:

        bits.append('0')

    pbin = ''.join(bits) # it's the binary after the dot

  # the integer before the dot is easily transformed into a binary
  result0=bin(int(a))
  result0=result0[2:] #0b
  lenght_0=len(result0)
  lenght_1=len(pbin)
  for i in range(max_bits-lenght_0):
    result0='0'+result0
  #print('lenght_1',lenght_1)
  if lenght_1==max_bits:
    # print(666)
    pass
  
  elif lenght_1<max_bits:
      for i in range(max_bits-lenght_1):
        pbin=pbin+'0'

  else:
    pbin=pbin[:max_bits]
  # return '.'.join((result0,pbin))
  result=''.join((result0,pbin))
  if(sign_flag):
    result=buma(result)
  return result

f = open("./data/s.txt",encoding='utf-8')
with open('./data/s_after_pre.txt','w',encoding='utf-8') as f1:
  while True:
      line = f.readline()
      if line:
          # print (line)
            # data_pre=bin(int(data))[2:]
            data_pre=(str2bin(line,16))
            # print('line',line,'data_pre',data_pre)
            f1.write(data_pre+'\n')
          # arr[0],'arr[0]',arr[1],'arr[1]')
      else:
          break
f.close()
f1.close()