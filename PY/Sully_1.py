import os
s = """import os
s = {q}{q}{q}{s}{q}{q}{q}
if __name__ == '__main__':
    i = {i}
    if 'Sully.py' != os.path.basename(__file__):
        i -= 1
    if i >= 0:
        fn = 'Sully_' + str(i) + '.py'
        with open(fn, 'w') as fi:
            fi.write(s.format(q = chr(34), s = s, i = i))
        os.system('python3 ' + fn)"""
if __name__ == '__main__':
    i = 1
    if 'Sully.py' != os.path.basename(__file__):
        i -= 1
    if i >= 0:
        fn = 'Sully_' + str(i) + '.py'
        with open(fn, 'w') as fi:
            fi.write(s.format(q = chr(34), s = s, i = i))
        os.system('python3 ' + fn)