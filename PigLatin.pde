public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	ArrayList <Integer> vowelInd = new ArrayList <Integer>();
  vowelInd.add(sWord.indexOf("a"));
  vowelInd.add(sWord.indexOf("e"));
  vowelInd.add(sWord.indexOf("i"));
  vowelInd.add(sWord.indexOf("o"));
  vowelInd.add(sWord.indexOf("u"));
  for (int i=0;i<vowelInd.size();i++)
  if (vowelInd.get(i)==-1)
  {
  vowelInd.remove(i);
  i--;
  }
  if (vowelInd.size()==0) {return -1;}
  int temp = vowelInd.get(0);
  for (int s:vowelInd)
  if (s<temp)
  temp=s;
  return temp;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if (findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if (findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}
  else if (sWord.substring(0,2).equals("qu"))
  {
    return sWord.substring(2,sWord.length())+sWord.substring(0,2)+"ay";
  }
  else 
  {
    return sWord.substring(findFirstVowel(sWord),sWord.length())+sWord.substring(0,findFirstVowel(sWord))+"ay";
  }
}