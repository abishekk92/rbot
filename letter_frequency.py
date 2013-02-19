from collections import  Counter
import matplotlib.pyplot as pyplot
letter_frequency={}
NUMBER_OF_WORDS=48953
AVG_LINE_LENGTH=10
def calculate_frequency(line):
	letter_count=dict(Counter(line))
	for key in letter_count.keys():
		if key != "\n" and key!= "\r" :
			local_letter_frequency=float(letter_count[key])/len(line)
			if key in letter_frequency:
				letter_frequency[key]+=local_letter_frequency
			else:
				letter_frequency[key]=local_letter_frequency
def calculate_word_probability(key):
	letter_frequency[key]=(letter_frequency[key]/NUMBER_OF_WORDS)*AVG_LINE_LENGTH
for line in open("words.dat",'r'): calculate_frequency(line)
map(calculate_word_probability,letter_frequency.keys())

'''
pyplot.plot(range(1,27),letter_frequency.values())
pyplot.autoscale(False)
pyplot.show()
'''
letter_file=open('probabilities.txt','w')
for key,value in letter_frequency.items(): letter_file.write(key+','+str(value)+"\n")



