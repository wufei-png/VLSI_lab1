def convert16to10(width,data):
 # 16进制数所占位数

  dec_data=int(data, 16)
  print(dec_data)
  if dec_data > 2 ** (width-1)- 1:
      dec_data = 2 ** width-dec_data
      dec_data=0-dec_data
  print(dec_data/2 ** (width/2))
data='0100'
convert16to10(32,'00000060')