#include <stdio.h>
#include <string.h>
#include "ex1.h"

/* Returns the number of times LETTER appears in STR.
There are two different ways to iterate through a string.
1st way hint: strlen() may be useful
2nd way hint: all strings end in a null terminator */
int num_occurrences(char *str, char letter) {
	int out = 0;
	do {
		if (*str == letter) {
			out += 1;
		}
		str += 1;

	} while (*str); 
	return out;
}

/* Populates DNA_SEQ with the number of times each nucleotide appears.
Each sequence will end with a NULL terminator and will have up to 20 nucleotides.
All letters will be upper case. */
void compute_nucleotide_occurrences(DNA_sequence *dna_seq) {
    char *seq = dna_seq->sequence;
	dna_seq->A_count = 0;
	dna_seq->G_count = 0;
	dna_seq->T_count = 0;
	dna_seq->C_count = 0;
    while (*seq) {
        switch (*seq) {
            case 'A':
                dna_seq->A_count += 1;
                break;
            case 'T':
                dna_seq->T_count += 1;
                break;
            case 'G':
                dna_seq->G_count += 1;
                break;
            case 'C':
                dna_seq->C_count += 1;
                break;
            default:
                break; 
        }
        seq++; 
    }
    return;
}

