# Enigma-
Mod1 Final Project

For functionality my project implements encrypt & decrypt in the Enigma Class & methods along with the command line interface being fully functional. I did not get to the Cracking method so my functionality does not meet a 4. I give myself a 3 for functionality.

For OOP my project is broken into logical components that are appropriately encapsulated. I do have one small class that is my KeyGenerator class. I could have implemented a module here to make the code more DRY. However, in total I have 3 classes, Enigma, Shift, & KeyGenerator. In my opinion this is not excessive. It might be slightly damp, but I wouldn't call it Wet code. Every method also has a single responsibility. I used helper methods in the Enigma class for encrypt & decrypt. I used encrypted message & decrypted message & then called upon those methods in my encrypt & decrypt methods. This is an example of using the single responsibility principle. I would give myself a 3 for OOP.

The code is properly indented & formatted. Class, method, variable, & file names follow convention. Most of the enumerables I used are the most efficient tool for a given job, (i.e. map.with_index). I implemented multiple hashes in ways that make logical sense. I would give my self a 3 for Ruby mechanics & conventions.

Every method is tested on the unit & integration level. I addressed obvious edge cases, like spaces or characters not being in the alphabet. This works by passing the character through the encrypt/decrypt as the character it itself. (! passes in as an !, and doesn't throw an error for not being in the alphabet). My simplecov coverage is at 100%. I would gice myself a 3 for TDD.

For version control I have 4 merged pull requests & 33 commits. The pull requests included logical amounts of functionality, and are named for what that functionality is. I would give myself a 3 for version control. 
