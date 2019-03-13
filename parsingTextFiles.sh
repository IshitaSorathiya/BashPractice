#!/bin/bash

####Task 1.1
#Check whether the file exists or not - if exists remove the file from directory
if [ -e CombinedTextFile.txt ] 
then
	rm CombinedTextFile.txt
fi
#Copies all the data of all the six file into a single file
cat 1112.txt 1120.txt 1513-0.txt 1524-0.txt 2253.txt 2267.txt > CombinedTextFile.txt

#Check whether the file exists or not - if exists removes the file from directory
if [ -e CombinedFileWithoutPunct.txt ]
then
	rm CombinedTextFileWithoutPunct.txt
fi
#Removes punctuation marks from the newly generated file
cat CombinedTextFile.txt | tr -d [:punct:] > CombinedTextFileWithoutPunct.txt

####Task 1.2
#Separated all the words from a line to a new line, sorting the words and then copying it into a file 
cat CombinedTextFileWithoutPunct.txt | tr [:space:] '\n' | tr [:upper:] [:lower:] | grep -v '^\n*$' | sort > LinesIntoWords.txt

#Counts the 20 most frequent words and displays on the screen
echo "20 Most Frequent Words"
cat LinesIntoWords.txt | uniq -c | sort -g | tail -n 20 | sort -nr 


####Task 1.3
#Loop through all the stop words in the file named stopwordsSorted.txt and check whether that stop word exists in the main file
for word in $(cat snowball_original.txt)
do
	#if stop word exists replaces it with blank value	
	sed -i "s/\<${word}\>//g" LinesIntoWords.txt
done

####Task 1.4
#Calculates the most frequent 20 words after removing stop words
echo "20 Most Frequent Words after removing Stop words"
cat LinesIntoWords.txt | grep -v "^\n*$" |  uniq -c | sort -g | tail -n 20 | sort -nr

