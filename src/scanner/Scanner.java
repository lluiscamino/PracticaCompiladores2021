// DO NOT EDIT
// Generated by JFlex 1.8.2 http://jflex.de/
// source: Documents/NetBeansProjects/Compiladores2020/src/scanner/scanner.flex

package scanner;

import parser.ParserSym;
import java_cup.runtime.*;
import java_cup.runtime.ComplexSymbolFactory.ComplexSymbol;
import parser.RelationalOperatorType;
import exceptions.LexicalError;


// See https://github.com/jflex-de/jflex/issues/222
@SuppressWarnings("FallThrough")
public class Scanner implements java_cup.runtime.Scanner {

  /** This character denotes the end of file. */
  public static final int YYEOF = -1;

  /** Initial size of the lookahead buffer. */
  private static final int ZZ_BUFFERSIZE = 16384;

  // Lexical states.
  public static final int YYINITIAL = 0;

  /**
   * ZZ_LEXSTATE[l] is the state in the DFA for the lexical state l
   * ZZ_LEXSTATE[l+1] is the state in the DFA for the lexical state l
   *                  at the beginning of a line
   * l is of the form l = 2*k, k a non negative integer
   */
  private static final int ZZ_LEXSTATE[] = {
     0, 0
  };

  /**
   * Top-level table for translating characters to character classes
   */
  private static final int [] ZZ_CMAP_TOP = zzUnpackcmap_top();

  private static final String ZZ_CMAP_TOP_PACKED_0 =
    "\1\0\u10ff\u0100";

  private static int [] zzUnpackcmap_top() {
    int [] result = new int[4352];
    int offset = 0;
    offset = zzUnpackcmap_top(ZZ_CMAP_TOP_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackcmap_top(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /**
   * Second-level tables for translating characters to character classes
   */
  private static final int [] ZZ_CMAP_BLOCKS = zzUnpackcmap_blocks();

  private static final String ZZ_CMAP_BLOCKS_PACKED_0 =
    "\11\0\2\1\2\0\1\1\22\0\1\1\1\2\1\3"+
    "\1\0\1\4\1\5\1\6\1\0\1\7\1\10\1\11"+
    "\1\12\1\13\1\14\1\0\1\15\12\16\1\0\1\17"+
    "\1\20\1\21\1\20\2\0\32\4\1\22\1\0\1\23"+
    "\1\24\1\4\1\0\1\25\1\26\1\27\1\30\1\31"+
    "\1\32\1\33\1\34\1\35\2\4\1\36\1\37\1\40"+
    "\1\41\1\42\1\4\1\43\1\44\1\45\1\46\1\47"+
    "\1\50\1\4\1\51\1\4\1\52\1\53\1\54\u0182\0";

  private static int [] zzUnpackcmap_blocks() {
    int [] result = new int[512];
    int offset = 0;
    offset = zzUnpackcmap_blocks(ZZ_CMAP_BLOCKS_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackcmap_blocks(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }

  /**
   * Translates DFA states to action switch labels.
   */
  private static final int [] ZZ_ACTION = zzUnpackAction();

  private static final String ZZ_ACTION_PACKED_0 =
    "\1\0\1\1\1\2\1\0\1\3\1\4\1\0\1\5"+
    "\1\6\1\7\1\10\1\11\1\12\1\13\1\14\1\15"+
    "\1\16\1\17\1\20\1\21\14\3\1\22\1\0\1\23"+
    "\1\16\1\24\1\25\1\0\5\3\1\26\10\3\1\27"+
    "\1\30\5\3\1\31\7\3\1\32\5\3\1\33\5\3"+
    "\1\34\1\3\1\35\1\3\1\36\1\3\1\37\1\3"+
    "\1\0\2\3\1\40\3\3\1\41\1\42\2\3\1\43"+
    "\1\3\1\44";

  private static int [] zzUnpackAction() {
    int [] result = new int[102];
    int offset = 0;
    offset = zzUnpackAction(ZZ_ACTION_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAction(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /**
   * Translates a state to a row index in the transition table
   */
  private static final int [] ZZ_ROWMAP = zzUnpackRowMap();

  private static final String ZZ_ROWMAP_PACKED_0 =
    "\0\0\0\55\0\132\0\207\0\264\0\341\0\u010e\0\341"+
    "\0\341\0\341\0\341\0\341\0\341\0\341\0\u013b\0\341"+
    "\0\132\0\132\0\u0168\0\341\0\u0195\0\u01c2\0\u01ef\0\u021c"+
    "\0\u0249\0\u0276\0\u02a3\0\u02d0\0\u02fd\0\u032a\0\u0357\0\u0384"+
    "\0\341\0\u03b1\0\341\0\341\0\341\0\341\0\u03de\0\u040b"+
    "\0\u0438\0\u0465\0\u0492\0\u04bf\0\264\0\u04ec\0\u0519\0\u0546"+
    "\0\u0573\0\u05a0\0\u05cd\0\u05fa\0\u0627\0\341\0\341\0\u0654"+
    "\0\u0681\0\u06ae\0\u06db\0\u0708\0\264\0\u0735\0\u0762\0\u078f"+
    "\0\u07bc\0\u07e9\0\u0816\0\u0843\0\264\0\u0870\0\u089d\0\u08ca"+
    "\0\u08f7\0\u0924\0\264\0\u0951\0\u097e\0\u09ab\0\u09d8\0\u0a05"+
    "\0\264\0\u0a32\0\264\0\u0a5f\0\264\0\u0a8c\0\264\0\u0ab9"+
    "\0\u0ae6\0\u0b13\0\u0b40\0\264\0\u0b6d\0\u0b9a\0\u0bc7\0\341"+
    "\0\264\0\u0bf4\0\u0c21\0\264\0\u0c4e\0\264";

  private static int [] zzUnpackRowMap() {
    int [] result = new int[102];
    int offset = 0;
    offset = zzUnpackRowMap(ZZ_ROWMAP_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackRowMap(String packed, int offset, int [] result) {
    int i = 0;  /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int high = packed.charAt(i++) << 16;
      result[j++] = high | packed.charAt(i++);
    }
    return j;
  }

  /**
   * The transition table of the DFA
   */
  private static final int [] ZZ_TRANS = zzUnpackTrans();

  private static final String ZZ_TRANS_PACKED_0 =
    "\1\0\1\2\1\3\1\4\1\5\1\6\1\7\1\10"+
    "\1\11\1\12\1\13\1\14\1\15\1\16\1\17\1\20"+
    "\1\21\1\22\1\23\1\24\1\0\1\25\1\26\1\27"+
    "\2\5\1\30\2\5\1\31\1\5\1\32\2\5\1\33"+
    "\1\34\1\35\1\36\1\5\1\37\1\40\1\5\1\41"+
    "\1\42\1\43\1\0\1\2\74\0\1\44\36\0\1\45"+
    "\1\4\11\0\1\4\6\0\25\4\7\0\1\5\11\0"+
    "\1\5\6\0\25\5\66\0\1\46\64\0\1\17\62\0"+
    "\1\47\34\0\1\5\11\0\1\5\6\0\16\5\1\50"+
    "\6\5\7\0\1\5\11\0\1\5\6\0\14\5\1\51"+
    "\10\5\7\0\1\5\11\0\1\5\6\0\14\5\1\52"+
    "\10\5\7\0\1\5\11\0\1\5\6\0\1\53\20\5"+
    "\1\54\3\5\7\0\1\5\11\0\1\5\6\0\5\5"+
    "\1\55\5\5\1\56\11\5\7\0\1\5\11\0\1\5"+
    "\6\0\1\57\24\5\7\0\1\5\11\0\1\5\6\0"+
    "\16\5\1\60\6\5\7\0\1\5\11\0\1\5\6\0"+
    "\4\5\1\61\20\5\7\0\1\5\11\0\1\5\6\0"+
    "\20\5\1\62\4\5\7\0\1\5\11\0\1\5\6\0"+
    "\16\5\1\63\6\5\7\0\1\5\11\0\1\5\6\0"+
    "\1\64\24\5\7\0\1\5\11\0\1\5\6\0\7\5"+
    "\1\65\15\5\56\0\1\66\24\0\1\67\35\0\1\5"+
    "\11\0\1\5\6\0\16\5\1\70\6\5\7\0\1\5"+
    "\11\0\1\5\6\0\14\5\1\71\10\5\7\0\1\5"+
    "\11\0\1\5\6\0\13\5\1\72\11\5\7\0\1\5"+
    "\11\0\1\5\6\0\11\5\1\73\13\5\7\0\1\5"+
    "\11\0\1\5\6\0\13\5\1\74\11\5\7\0\1\5"+
    "\11\0\1\5\6\0\20\5\1\75\4\5\7\0\1\5"+
    "\11\0\1\5\6\0\10\5\1\76\14\5\7\0\1\5"+
    "\11\0\1\5\6\0\10\5\1\77\3\5\1\100\10\5"+
    "\7\0\1\5\11\0\1\5\6\0\1\101\17\5\1\102"+
    "\4\5\7\0\1\5\11\0\1\5\6\0\16\5\1\103"+
    "\6\5\7\0\1\5\11\0\1\5\6\0\21\5\1\104"+
    "\3\5\7\0\1\5\11\0\1\5\6\0\16\5\1\105"+
    "\6\5\7\0\1\5\11\0\1\5\6\0\10\5\1\106"+
    "\14\5\7\0\1\5\11\0\1\5\6\0\1\107\24\5"+
    "\7\0\1\5\11\0\1\5\6\0\11\5\1\110\13\5"+
    "\7\0\1\5\11\0\1\5\6\0\17\5\1\111\5\5"+
    "\7\0\1\5\11\0\1\5\6\0\17\5\1\104\5\5"+
    "\7\0\1\5\11\0\1\5\6\0\2\5\1\112\22\5"+
    "\7\0\1\5\11\0\1\5\6\0\13\5\1\113\11\5"+
    "\7\0\1\5\11\0\1\5\6\0\13\5\1\114\11\5"+
    "\7\0\1\5\11\0\1\5\6\0\2\5\1\115\22\5"+
    "\7\0\1\5\11\0\1\5\6\0\3\5\1\116\21\5"+
    "\7\0\1\5\11\0\1\5\6\0\21\5\1\117\3\5"+
    "\7\0\1\5\11\0\1\5\6\0\10\5\1\120\14\5"+
    "\7\0\1\5\11\0\1\5\6\0\4\5\1\121\20\5"+
    "\7\0\1\5\11\0\1\5\6\0\11\5\1\122\13\5"+
    "\7\0\1\5\11\0\1\5\6\0\24\5\1\123\7\0"+
    "\1\5\11\0\1\5\6\0\4\5\1\124\20\5\7\0"+
    "\1\5\11\0\1\5\6\0\20\5\1\125\4\5\7\0"+
    "\1\5\11\0\1\5\6\0\20\5\1\126\4\5\7\0"+
    "\1\5\11\0\1\5\6\0\20\5\1\127\4\5\7\0"+
    "\1\5\11\0\1\5\6\0\4\5\1\130\20\5\7\0"+
    "\1\5\2\0\1\131\6\0\1\5\6\0\25\5\7\0"+
    "\1\5\11\0\1\5\6\0\16\5\1\132\6\5\7\0"+
    "\1\5\11\0\1\5\6\0\13\5\1\133\11\5\7\0"+
    "\1\5\11\0\1\5\6\0\4\5\1\134\20\5\7\0"+
    "\1\5\11\0\1\5\6\0\1\135\24\5\7\0\1\5"+
    "\11\0\1\5\6\0\10\5\1\136\14\5\7\0\1\5"+
    "\11\0\1\5\6\0\3\5\1\137\21\5\13\0\1\140"+
    "\50\0\1\5\11\0\1\5\6\0\13\5\1\141\11\5"+
    "\7\0\1\5\11\0\1\5\6\0\6\5\1\75\16\5"+
    "\7\0\1\5\11\0\1\5\6\0\13\5\1\75\11\5"+
    "\7\0\1\5\11\0\1\5\6\0\14\5\1\142\10\5"+
    "\7\0\1\5\11\0\1\5\6\0\21\5\1\143\3\5"+
    "\7\0\1\5\11\0\1\5\6\0\13\5\1\144\11\5"+
    "\7\0\1\5\11\0\1\5\6\0\16\5\1\145\6\5"+
    "\7\0\1\5\11\0\1\5\6\0\4\5\1\146\20\5"+
    "\3\0";

  private static int [] zzUnpackTrans() {
    int [] result = new int[3195];
    int offset = 0;
    offset = zzUnpackTrans(ZZ_TRANS_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackTrans(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      value--;
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /** Error code for "Unknown internal scanner error". */
  private static final int ZZ_UNKNOWN_ERROR = 0;
  /** Error code for "could not match input". */
  private static final int ZZ_NO_MATCH = 1;
  /** Error code for "pushback value was too large". */
  private static final int ZZ_PUSHBACK_2BIG = 2;

  /**
   * Error messages for {@link #ZZ_UNKNOWN_ERROR}, {@link #ZZ_NO_MATCH}, and
   * {@link #ZZ_PUSHBACK_2BIG} respectively.
   */
  private static final String ZZ_ERROR_MSG[] = {
    "Unknown internal scanner error",
    "Error: could not match input",
    "Error: pushback value was too large"
  };

  /**
   * ZZ_ATTRIBUTE[aState] contains the attributes of state {@code aState}
   */
  private static final int [] ZZ_ATTRIBUTE = zzUnpackAttribute();

  private static final String ZZ_ATTRIBUTE_PACKED_0 =
    "\1\0\2\1\1\0\1\1\1\11\1\0\7\11\1\1"+
    "\1\11\3\1\1\11\14\1\1\11\1\0\4\11\1\0"+
    "\16\1\2\11\41\1\1\0\6\1\1\11\6\1";

  private static int [] zzUnpackAttribute() {
    int [] result = new int[102];
    int offset = 0;
    offset = zzUnpackAttribute(ZZ_ATTRIBUTE_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAttribute(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }

  /** Input device. */
  private java.io.Reader zzReader;

  /** Current state of the DFA. */
  private int zzState;

  /** Current lexical state. */
  private int zzLexicalState = YYINITIAL;

  /**
   * This buffer contains the current text to be matched and is the source of the {@link #yytext()}
   * string.
   */
  private char zzBuffer[] = new char[ZZ_BUFFERSIZE];

  /** Text position at the last accepting state. */
  private int zzMarkedPos;

  /** Current text position in the buffer. */
  private int zzCurrentPos;

  /** Marks the beginning of the {@link #yytext()} string in the buffer. */
  private int zzStartRead;

  /** Marks the last character in the buffer, that has been read from input. */
  private int zzEndRead;

  /**
   * Whether the scanner is at the end of file.
   * @see #yyatEOF
   */
  private boolean zzAtEOF;

  /**
   * The number of occupied positions in {@link #zzBuffer} beyond {@link #zzEndRead}.
   *
   * <p>When a lead/high surrogate has been read from the input stream into the final
   * {@link #zzBuffer} position, this will have a value of 1; otherwise, it will have a value of 0.
   */
  private int zzFinalHighSurrogate = 0;

  /** Number of newlines encountered up to the start of the matched text. */
  @SuppressWarnings("unused")
  private int yyline;

  /** Number of characters from the last newline up to the start of the matched text. */
  @SuppressWarnings("unused")
  private int yycolumn;

  /** Number of characters up to the start of the matched text. */
  @SuppressWarnings("unused")
  private long yychar;

  /** Whether the scanner is currently at the beginning of a line. */
  @SuppressWarnings("unused")
  private boolean zzAtBOL = true;

  /** Whether the user-EOF-code has already been executed. */
  @SuppressWarnings("unused")
  private boolean zzEOFDone;

  /* user code: */
    private Symbol symbol(int type) {
        return new ComplexSymbol(ParserSym.terminalNames[type], type);
    }
    
    private Symbol symbol(int type, Object value) {
        return new ComplexSymbol(ParserSym.terminalNames[type], type, value);
    }

    private Symbol relationalSymbol(String value) {
        RelationalOperatorType relType = RelationalOperatorType.get(value);
        return new ComplexSymbol(ParserSym.terminalNames[ParserSym.REL], ParserSym.REL, relType);
    }


  /**
   * Creates a new scanner
   *
   * @param   in  the java.io.Reader to read input from.
   */
  public Scanner(java.io.Reader in) {
    this.zzReader = in;
  }

  /**
   * Translates raw input code points to DFA table row
   */
  private static int zzCMap(int input) {
    int offset = input & 255;
    return offset == input ? ZZ_CMAP_BLOCKS[offset] : ZZ_CMAP_BLOCKS[ZZ_CMAP_TOP[input >> 8] | offset];
  }

  /**
   * Refills the input buffer.
   *
   * @return {@code false} iff there was new input.
   * @exception java.io.IOException  if any I/O-Error occurs
   */
  private boolean zzRefill() throws java.io.IOException {

    /* first: make room (if you can) */
    if (zzStartRead > 0) {
      zzEndRead += zzFinalHighSurrogate;
      zzFinalHighSurrogate = 0;
      System.arraycopy(zzBuffer, zzStartRead,
                       zzBuffer, 0,
                       zzEndRead - zzStartRead);

      /* translate stored positions */
      zzEndRead -= zzStartRead;
      zzCurrentPos -= zzStartRead;
      zzMarkedPos -= zzStartRead;
      zzStartRead = 0;
    }

    /* is the buffer big enough? */
    if (zzCurrentPos >= zzBuffer.length - zzFinalHighSurrogate) {
      /* if not: blow it up */
      char newBuffer[] = new char[zzBuffer.length * 2];
      System.arraycopy(zzBuffer, 0, newBuffer, 0, zzBuffer.length);
      zzBuffer = newBuffer;
      zzEndRead += zzFinalHighSurrogate;
      zzFinalHighSurrogate = 0;
    }

    /* fill the buffer with new input */
    int requested = zzBuffer.length - zzEndRead;
    int numRead = zzReader.read(zzBuffer, zzEndRead, requested);

    /* not supposed to occur according to specification of java.io.Reader */
    if (numRead == 0) {
      throw new java.io.IOException(
          "Reader returned 0 characters. See JFlex examples/zero-reader for a workaround.");
    }
    if (numRead > 0) {
      zzEndRead += numRead;
      if (Character.isHighSurrogate(zzBuffer[zzEndRead - 1])) {
        if (numRead == requested) { // We requested too few chars to encode a full Unicode character
          --zzEndRead;
          zzFinalHighSurrogate = 1;
        } else {                    // There is room in the buffer for at least one more char
          int c = zzReader.read();  // Expecting to read a paired low surrogate char
          if (c == -1) {
            return true;
          } else {
            zzBuffer[zzEndRead++] = (char)c;
          }
        }
      }
      /* potentially more input available */
      return false;
    }

    /* numRead < 0 ==> end of stream */
    return true;
  }


  /**
   * Closes the input reader.
   *
   * @throws java.io.IOException if the reader could not be closed.
   */
  public final void yyclose() throws java.io.IOException {
    zzAtEOF = true; // indicate end of file
    zzEndRead = zzStartRead; // invalidate buffer

    if (zzReader != null) {
      zzReader.close();
    }
  }


  /**
   * Resets the scanner to read from a new input stream.
   *
   * <p>Does not close the old reader.
   *
   * <p>All internal variables are reset, the old input stream <b>cannot</b> be reused (internal
   * buffer is discarded and lost). Lexical state is set to {@code ZZ_INITIAL}.
   *
   * <p>Internal scan buffer is resized down to its initial length, if it has grown.
   *
   * @param reader The new input stream.
   */
  public final void yyreset(java.io.Reader reader) {
    zzReader = reader;
    zzEOFDone = false;
    yyResetPosition();
    zzLexicalState = YYINITIAL;
    if (zzBuffer.length > ZZ_BUFFERSIZE) {
      zzBuffer = new char[ZZ_BUFFERSIZE];
    }
  }

  /**
   * Resets the input position.
   */
  private final void yyResetPosition() {
      zzAtBOL  = true;
      zzAtEOF  = false;
      zzCurrentPos = 0;
      zzMarkedPos = 0;
      zzStartRead = 0;
      zzEndRead = 0;
      zzFinalHighSurrogate = 0;
      yyline = 0;
      yycolumn = 0;
      yychar = 0L;
  }


  /**
   * Returns whether the scanner has reached the end of the reader it reads from.
   *
   * @return whether the scanner has reached EOF.
   */
  public final boolean yyatEOF() {
    return zzAtEOF;
  }


  /**
   * Returns the current lexical state.
   *
   * @return the current lexical state.
   */
  public final int yystate() {
    return zzLexicalState;
  }


  /**
   * Enters a new lexical state.
   *
   * @param newState the new lexical state
   */
  public final void yybegin(int newState) {
    zzLexicalState = newState;
  }


  /**
   * Returns the text matched by the current regular expression.
   *
   * @return the matched text.
   */
  public final String yytext() {
    return new String(zzBuffer, zzStartRead, zzMarkedPos-zzStartRead);
  }


  /**
   * Returns the character at the given position from the matched text.
   *
   * <p>It is equivalent to {@code yytext().charAt(pos)}, but faster.
   *
   * @param position the position of the character to fetch. A value from 0 to {@code yylength()-1}.
   *
   * @return the character at {@code position}.
   */
  public final char yycharat(int position) {
    return zzBuffer[zzStartRead + position];
  }


  /**
   * How many characters were matched.
   *
   * @return the length of the matched text region.
   */
  public final int yylength() {
    return zzMarkedPos-zzStartRead;
  }


  /**
   * Reports an error that occurred while scanning.
   *
   * <p>In a well-formed scanner (no or only correct usage of {@code yypushback(int)} and a
   * match-all fallback rule) this method will only be called with things that
   * "Can't Possibly Happen".
   *
   * <p>If this method is called, something is seriously wrong (e.g. a JFlex bug producing a faulty
   * scanner etc.).
   *
   * <p>Usual syntax/scanner level error handling should be done in error fallback rules.
   *
   * @param errorCode the code of the error message to display.
   */
  private static void zzScanError(int errorCode) {
    String message;
    try {
      message = ZZ_ERROR_MSG[errorCode];
    } catch (ArrayIndexOutOfBoundsException e) {
      message = ZZ_ERROR_MSG[ZZ_UNKNOWN_ERROR];
    }

    throw new Error(message);
  }


  /**
   * Pushes the specified amount of characters back into the input stream.
   *
   * <p>They will be read again by then next call of the scanning method.
   *
   * @param number the number of characters to be read again. This number must not be greater than
   *     {@link #yylength()}.
   */
  public void yypushback(int number)  {
    if ( number > yylength() )
      zzScanError(ZZ_PUSHBACK_2BIG);

    zzMarkedPos -= number;
  }




  /**
   * Resumes scanning until the next regular expression is matched, the end of input is encountered
   * or an I/O-Error occurs.
   *
   * @return the next token.
   * @exception java.io.IOException if any I/O-Error occurs.
   */
  public java_cup.runtime.Symbol next_token() throws java.io.IOException, LexicalError {
    int zzInput;
    int zzAction;

    // cached fields:
    int zzCurrentPosL;
    int zzMarkedPosL;
    int zzEndReadL = zzEndRead;
    char[] zzBufferL = zzBuffer;

    int [] zzTransL = ZZ_TRANS;
    int [] zzRowMapL = ZZ_ROWMAP;
    int [] zzAttrL = ZZ_ATTRIBUTE;

    while (true) {
      zzMarkedPosL = zzMarkedPos;

      zzAction = -1;

      zzCurrentPosL = zzCurrentPos = zzStartRead = zzMarkedPosL;

      zzState = ZZ_LEXSTATE[zzLexicalState];

      // set up zzAction for empty match case:
      int zzAttributes = zzAttrL[zzState];
      if ( (zzAttributes & 1) == 1 ) {
        zzAction = zzState;
      }


      zzForAction: {
        while (true) {

          if (zzCurrentPosL < zzEndReadL) {
            zzInput = Character.codePointAt(zzBufferL, zzCurrentPosL, zzEndReadL);
            zzCurrentPosL += Character.charCount(zzInput);
          }
          else if (zzAtEOF) {
            zzInput = YYEOF;
            break zzForAction;
          }
          else {
            // store back cached positions
            zzCurrentPos  = zzCurrentPosL;
            zzMarkedPos   = zzMarkedPosL;
            boolean eof = zzRefill();
            // get translated positions and possibly new buffer
            zzCurrentPosL  = zzCurrentPos;
            zzMarkedPosL   = zzMarkedPos;
            zzBufferL      = zzBuffer;
            zzEndReadL     = zzEndRead;
            if (eof) {
              zzInput = YYEOF;
              break zzForAction;
            }
            else {
              zzInput = Character.codePointAt(zzBufferL, zzCurrentPosL, zzEndReadL);
              zzCurrentPosL += Character.charCount(zzInput);
            }
          }
          int zzNext = zzTransL[ zzRowMapL[zzState] + zzCMap(zzInput) ];
          if (zzNext == -1) break zzForAction;
          zzState = zzNext;

          zzAttributes = zzAttrL[zzState];
          if ( (zzAttributes & 1) == 1 ) {
            zzAction = zzState;
            zzMarkedPosL = zzCurrentPosL;
            if ( (zzAttributes & 8) == 8 ) break zzForAction;
          }

        }
      }

      // store back cached position
      zzMarkedPos = zzMarkedPosL;

      if (zzInput == YYEOF && zzStartRead == zzCurrentPos) {
        zzAtEOF = true;
        return null;
      }
      else {
        switch (zzAction < 0 ? zzAction : ZZ_ACTION[zzAction]) {
          case 1:
            { 
            }
            // fall through
          case 37: break;
          case 2:
            { return symbol(ParserSym.NOT);
            }
            // fall through
          case 38: break;
          case 3:
            { return symbol(ParserSym.IDENT, yytext());
            }
            // fall through
          case 39: break;
          case 4:
            { return symbol(ParserSym.MOD);
            }
            // fall through
          case 40: break;
          case 5:
            { return symbol(ParserSym.L_PAR);
            }
            // fall through
          case 41: break;
          case 6:
            { return symbol(ParserSym.R_PAR);
            }
            // fall through
          case 42: break;
          case 7:
            { return symbol(ParserSym.MUL);
            }
            // fall through
          case 43: break;
          case 8:
            { return symbol(ParserSym.ADD);
            }
            // fall through
          case 44: break;
          case 9:
            { return symbol(ParserSym.COMMA);
            }
            // fall through
          case 45: break;
          case 10:
            { return symbol(ParserSym.SUB);
            }
            // fall through
          case 46: break;
          case 11:
            { return symbol(ParserSym.DIV);
            }
            // fall through
          case 47: break;
          case 12:
            { return symbol(ParserSym.INT_LIT, Integer.parseInt(yytext()));
            }
            // fall through
          case 48: break;
          case 13:
            { return symbol(ParserSym.EOL);
            }
            // fall through
          case 49: break;
          case 14:
            { return relationalSymbol(this.yytext());
            }
            // fall through
          case 50: break;
          case 15:
            { return symbol(ParserSym.EQUALS);
            }
            // fall through
          case 51: break;
          case 16:
            { return symbol(ParserSym.L_BOX);
            }
            // fall through
          case 52: break;
          case 17:
            { return symbol(ParserSym.R_BOX);
            }
            // fall through
          case 53: break;
          case 18:
            { return symbol(ParserSym.L_BRK);
            }
            // fall through
          case 54: break;
          case 19:
            { return symbol(ParserSym.R_BRK);
            }
            // fall through
          case 55: break;
          case 20:
            { return symbol(ParserSym.STR_LIT, yytext());
            }
            // fall through
          case 56: break;
          case 21:
            { return symbol(ParserSym.AND);
            }
            // fall through
          case 57: break;
          case 22:
            { return symbol(ParserSym.IF);
            }
            // fall through
          case 58: break;
          case 23:
            { return symbol(ParserSym.OR);
            }
            // fall through
          case 59: break;
          case 24:
            { throw new LexicalError("Invalid sequence '" + yytext() + "'", 0);
            }
            // fall through
          case 60: break;
          case 25:
            { return symbol(ParserSym.PRIM_TYPE, yytext());
            }
            // fall through
          case 61: break;
          case 26:
            { return symbol(ParserSym.VAR);
            }
            // fall through
          case 62: break;
          case 27:
            { return symbol(ParserSym.MAIN);
            }
            // fall through
          case 63: break;
          case 28:
            { return symbol(ParserSym.BOOL_LIT, Boolean.parseBoolean(yytext()));
            }
            // fall through
          case 64: break;
          case 29:
            { return symbol(ParserSym.ARRAY);
            }
            // fall through
          case 65: break;
          case 30:
            { return symbol(ParserSym.CONST);
            }
            // fall through
          case 66: break;
          case 31:
            { return symbol(ParserSym.PRINT);
            }
            // fall through
          case 67: break;
          case 32:
            { return symbol(ParserSym.WHILE);
            }
            // fall through
          case 68: break;
          case 33:
            { return symbol(ParserSym.READ);
            }
            // fall through
          case 69: break;
          case 34:
            { return symbol(ParserSym.RETURN);
            }
            // fall through
          case 70: break;
          case 35:
            { return symbol(ParserSym.FUNCTION);
            }
            // fall through
          case 71: break;
          case 36:
            { return symbol(ParserSym.PROCEDURE);
            }
            // fall through
          case 72: break;
          default:
            zzScanError(ZZ_NO_MATCH);
        }
      }
    }
  }


}
