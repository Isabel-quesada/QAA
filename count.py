#!/usr/bin/env python

'''This program will parse the contents of a SAM file and count the number 
of reads that are properly mapped to the reference genome and the number
of reads that are not mapped to the genome'''
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="A program to check whethere my reads are mapped or unmapped")
    parser.add_argument("-f1", "--file1", help="to specify the filename")
    return parser.parse_args()

#global variables
args = get_args()
file1 = args.file1
mapped = 0
unmapped = 0

with open(file1, 'r') as fh:
    flag = 0
    for line in fh:
        if not line.startswith('@'):     #removing the header lines
            line = line.split()
            flag = int(line[1])  #bitwise flag
            if((flag & 256) != 256): #loop continues if read has been aligned only once
                if((flag & 4) != 4): #loop through the flags and add to the correct counter
                    mapped+=1
                else:
                    unmapped+=1

    print(f'Number of mapped reads: {mapped}\nNumber of unmapped reads: {unmapped}')