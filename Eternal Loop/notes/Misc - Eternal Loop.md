# Misc - Eternal Loop
So it appears to be a zip file containing nested zip files, 
![[Pasted image 20211011002520.png]]

After some guessing I figure out the password for each zip file is the filename of the zip file it contains (minus the .zip).
![[Pasted image 20211011002552.png]]


Presumably given the name the nest is deep enough that the challenge isn't meant to be solved manually.
So a script needs to be written to automate unzipping the zip folder.

Simple automation of shell commands like this should probably just be achieved with a bash/zsh script. Although a Python script could be written using an archiving library, etc.

General flow of the script would be:
1. unzip initial zip that contains the nest (password: hackthebox)
2. Read out contents of the zip
3. There is only one file, the next zip, grab the filename of that zip minus ".zip" at the end
4. Use that filename to unzip the zip
5. Repeat steps 2-4 with new zip until I suppose an error happens because there's no more zips to unzip?

Now to implement this into a bash script.

## --Minor interlude later as I spend an hour setting up emacs, etc--

Alright, time to get started on this script. This is actually taking quite a bit of time to get started, reviewing cheatsheets, etc to remind myself of bash's syntax. It's not quite muscle memory like Python's is so I don't remember how functions work, etc. 
Another reason to do the script in Bash, it'd just be useful to get more familiar with Bash.

## --Few minutes later--

Oh god, you refer to passed arguments in a function by their position and not a name, I hate Bash scripting already.

## --A week or two later--
Well passed out, got too tired and then woke up sick, was sick for a week or two.
So time to pick up from where I left off I suppose, read my notes, figure out what I meant to do to finish this script and then I should finally be done I suppose.

## --An hour or two later--
Script's finally done!
And oh??
![[Pasted image 20211024080052.png]]
Uh. Tried manually extracting it with the usual, hackthebox, etc, that's not it.. hmm..

Welp! I think we're past the basic scripting stage, let's give brute force a shot I suppose,
I've tried all the passwords fitting to the rule so far, "hackthebox", maybe even just the filename of the last zip.. Still nothing.

## --15 minutes later--
Huh! Yea, would you look at that.
![[Pasted image 20211024080945.png]]
Alright, fantastic, just got to manually unzip this now and.. I'm done?

Ah, fantastic, it's a, uh something, but not a text file with the flag, that's for sure.
![[Pasted image 20211024081055.png]]

Alright, a sqlite database.
![[Pasted image 20211024081111.png]]

Little bit cheaty it feels like because I didn't actually need to open up the database but uh.
![[Pasted image 20211024081156.png]]

I'm gonna do it anyways.
![[Pasted image 20211024081233.png]]

Andddd nvm, you were clearly meant to search through the database somehow anyways for sure because it's not exactly small.
![[Pasted image 20211024081405.png]]

And there we go, I found the flag without using the slightly cheaty feeling "| grep HTB" lol.
![[Pasted image 20211024081608.png]]

# :D
![[Pasted image 20211024081756.png]]