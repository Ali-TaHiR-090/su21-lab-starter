#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
	if (head == NULL) {return 0;}
    node *fast_p = head;
	node *slow_p = head;

	do {
		fast_p = fast_p->next;
		if (fast_p == NULL) {break;}
		fast_p = fast_p->next;
		if (fast_p == NULL) {break;}
		if (fast_p == slow_p) {break;}
		slow_p = slow_p->next;
	} while (fast_p != slow_p || fast_p != NULL);
	if (fast_p == slow_p) {
		return 1;
	} else {
		return 0;
	}
}
