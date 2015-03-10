With Ada.Text_IO; Use Ada.Text_IO;
With Unchecked_Conversion;
With GenericStack;

Procedure Receiver is
--Stack Type Enumeration
Type DataChoice is (Char, Int, Date, Quit);
--Stack Operation Enumeration choices
Type StackCase is (Pop, Push, Quit);
--Month Enumeration  Choices
Type EnumMonth is (January, February, March, April, May, June, July, August, September, October, November, December, Quit);

--Record to process dates
Type DateRecord is record
Month: EnumMonth; 
Day:Integer Range 1..31; 
Year:Integer;
end record;

Package IIO is New Ada.Text_IO.Integer_IO(Integer); use IIO;
Package DIO is New Ada.Text_IO.Enumeration_IO(DataChoice); use DIO;
Package StkIO is New Ada.Text_IO.Enumeration_IO(StackCase); use StkIO;
Package MIO is New Ada.Text_IO.Enumeration_IO(EnumMonth); use MIO;

--Instantiations to convert between integer and character formats, 16 bits versus 8 bits
Function IntegerToCharacter is New Unchecked_Conversion(Integer,Character);
Function CharacterToInteger is New Unchecked_Conversion(Character,Integer);

CaseMenu:DataChoice;
StkOP:StackCase;
--Size of the Stack
M:Integer:=0;


Begin

Put_Line("Process: UserInput: Available Storage:  ");
Get(M);

loop
Put("Process: UserInput: Stack Data: Char, Int, Date, or Quit:  ");
Get(CaseMenu);
  Case CaseMenu is
    When Char=>
    Declare
    --Assuming that no string will exceed 255 characters in length
     StringInput:String(1..255);
     --Used for the length of the string
     LengthOfString:Integer;
     --Used for Conversions
     TemporaryCharacter:Character;
     --Notifys the user of an error
     ErrorCondition:Boolean:=False;
     Package InstantCharacter is New GenericStack(Character,M); Use InstantCharacter;
      Begin
        Loop
        new_line;
        Put_Line("Process: UserInput: Stack Operation: Push, Pop, or Quit: ");
        Get(StkOP);
        new_line;
          Case StkOP is 
          --Charater Push
          When Push=>
              Get_Line(StringInput,LengthOfString);
            Put_Line(StringInput(1..LengthOfString));
            If LengthOfString>0 Then
              For I in 1..LengthOfString loop
              Push(StringInput(I),ErrorCondition);
                If ErrorCondition= True Then
                Put_Line("Overflow");
                Exit;
                End If;
                End loop;
             End if;
                  If ErrorCondition=False Then
                  TemporaryCharacter:=IntegerToCharacter(LengthOFString);
                  Push(TemporaryCharacter,ErrorCondition);
                    If ErrorCondition= True Then
                    Put_Line("Overflow");
                    End if;
                    End if;
                    
          --Character Pop
          When Pop=>
          new_line;
          Pop(TemporaryCharacter,ErrorCondition);
            If ErrorCondition = True  Then
            Put_line("Underflow");
            
            else
            LengthOfString:=CharacterToInteger(TemporaryCharacter);
            new_line;
            Put(LengthOfString-1);
            For I in 1..LengthOfString Loop
            Pop(TemporaryCharacter, ErrorCondition);
              If ErrorCondition= True Then
              Put_Line("Underflow");
              exit;
              else
              Put(TemporaryCharacter);
            End if;
            End loop;
            end if;
            When Quit=>
            exit;
            When Others=>
            null;
            End Case;
            End Loop;
            End;
            
    When Int=>
    Declare
    --Used for Exceptions
    ErrorCondition:Boolean:=False;
    --Used for integer counter
    Knt:Integer:=0;    
    --Used for a holder
    TemporaryInteger:Integer:=-1;
    Package InstantInteger is New GenericStack(Integer,M); use InstantInteger;
    Begin
      loop
      new_line;
      Put_Line("Input whether you want to Push, Pop, or Quit: ");
      Get(StkOP);
      Case StkOP is
      
       --Integer Push
      When Push=>
      Put_Line("Enter integer string seperated by a space, and  a 0 to end it.:  ");
      Knt:=0;
        loop
        Get(TemporaryInteger);
          If TemporaryInteger=0 Then
            If Knt/=0 Then
              Push(Knt,ErrorCondition);
                If ErrorCondition= True Then
                  Put_Line("Overflow");
                End if;
            Exit;
          End if;
          End if;
          Push(TemporaryInteger,ErrorCondition);
          If ErrorCondition= True Then
            Put_Line("Overflow");
          Exit;
          End if;
          Knt:=Knt+1;
        End Loop;

      --Integer Pop
      When Pop=>
      Pop(Knt, ErrorCondition);
      If ErrorCondition= True Then
      Put_line("Underflow");
      Else
      new_line;
      Put(Knt);
        For I in 1..Knt loop
        Pop(TemporaryInteger,ErrorCondition);
          If ErrorCondition=True Then
          Put_Line("Underflow");
          Exit;
          Else
          Put(TemporaryInteger);
          
          End If;
          end loop;
          
          end if;
             When Quit=>
        Exit;
        When Others=>
        null;
        End Case;
        End Loop;
        End;
      
      When Date=>
      Declare

      TemporaryDate:DateRecord;
      --Used for counting dates in the string
      Knt:Integer:=0;
      --Used for Stack Exceptions
      ErrorCondition:Boolean:=False;
      count_date:Integer;
      Package InstantCount is New GenericStack(Integer,M); use InstantCount;
      Package InstantDate is New GenericStack(DateRecord,M); use InstantDate;
        Begin
          loop
          Put_Line("Input whether you want to Push, Pop, or Quit: ");
          Get(StkOP);
          Case StkOP is
          
              --Date Push
            When Push=> 
                         Knt:=0;
             count_date:=M;
              for i in 1.. count_date loop
              if ErrorCondition = False then
              Put("Enter the Month: "); Get(TemporaryDate.Month);
              Put("Enter the Day: "); Get(TemporaryDate.Day);
              Put("Enter the Year: "); Get(TemporaryDate.Year);
            InstantDate.Push(TemporaryDate,ErrorCondition);
            Knt:=Knt+1;
            exit;
            else
            Put("Overflow");
            exit;
            end if;
               
          end loop;
       
  
               

          --Date Pop
          When Pop=>
          for i in 1.. Knt loop
           Pop(TemporaryDate,ErrorCondition);
          if ErrorCondition=True then
          put("Underflow");
          new_line;
          else
         -- Pop(TemporaryDate,ErrorCondition);
            Put(TemporaryDate.Month,0);
            Put(",");
            Put(TemporaryDate.Day,0);
            Put(",");
            Put(TemporaryDate.Year,0);
            New_Line;
            
            exit;
            end if;
          
            end loop;           
           



            When Quit=>
            exit;
            When Others=>
            null;
            End Case;
            End Loop;
            End;
            
            When Quit=>
            exit;
            When Others=>
            null;
            end case;
            end loop;
            end Receiver;
