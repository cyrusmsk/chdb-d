import csv
import random

rows = 5000
columns = 3

def generate_random_row(ind, col):
    a = []
    l = [random.choice(range(10))]
    for j in range(col):
        l.append(random.random()  + random.random() ** (ind+1))
    a.append(l)
    return a

if __name__ == '__main__':
    f = open('sample.csv', 'w')
    w = csv.writer(f, lineterminator='\n')
    tmp = ["id"] + ["feat_"+str(i) for i in range(columns)]
    w.writerows([tmp])
    for i in range(rows):
        w.writerows(generate_random_row(i, columns))
    f.close()
