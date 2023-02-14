# Write a function translate(word_list, dictionary) that will RETURN the list of
# translated words given as the first argument word_list, based on the dictionary
# given as the second function argument dictionary.

# Inputs:
#     1. word_list - a Python list of strings, e.g., ['blue', 'slim', 'pencil']
#     2. dictionary - a Python dictionary such that the key is a string (word in
#        English), and the value is a list of tuples where each tuple 
#        (translation, probability) is defined as follows:
#        - translation is a string (word in Turkish)
#        - probability is the probability of translation being the correct 
#          translation (and given between 0 and 1).
#     E.g.,
#         dictionary = {
#             'blue': [('mavi', 0.8), ('deniz', 0.10), ('sınav', 0.10)],
#             'slim': [('ince', 0.6), ('narin', 0.4)],
#             'pencil': [('kalem', 0.4), ('kurşunkalem', 0.5), ('ibik', 0.1)]
#         }
#     Here, the word 'blue' can have three different translations in Turkish:
#     'mavi', 'deniz', or 'sinav', but the word 'mavi' is the most likely correct
#     translation with the probability of 0.8.


word_list = ['blue', 'slim', 'pencil']
dictionary = {
    'blue': [('mavi', 0.8), ('deniz', 0.10), ('sınav', 0.10)],
    'slim': [('ince', 0.6), ('narin', 0.4)],
    'pencil': [('kalem', 0.4), ('kurşunkalem', 0.5), ('ibik', 0.1)]
}

def translate(word_list, dictionary):
    converted_words=[]
    converted_words.append(dictionary[word_list[0]][0][0])
    converted_words.append(dictionary[word_list[1]][0][0])
    converted_words.append(dictionary[word_list[2]][0][0])

    return converted_words

print(translate(word_list, dictionary))