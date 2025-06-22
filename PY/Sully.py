from os import system
s = """"""
if __name__ == '__main__':
    i = -1
    if i >= 0:
        fn = 'Sully_' + i + '.py'
        with open(fn,'w') as fi:
            fi.write(s.format(q = chr(34), s = s, i = i))
        system('python3 ' + fn)