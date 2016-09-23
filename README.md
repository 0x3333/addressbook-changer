# addressbook-changer

Change phone numbers in Mac based on Regex using [AddressBook API](https://developer.apple.com/reference/addressbook/abaddressbook).

***Not to be used out of the box, you must customize the Regex before running***

In this implementation:

* Removes space, dash and parenthesis
* If number starts with `0`:
  * If number doesn't start with `0800`:
    * Replace first number with `+55`
