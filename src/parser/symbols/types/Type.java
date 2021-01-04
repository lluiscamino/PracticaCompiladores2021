package parser.symbols.types;

import dot.DotNode;
import java.io.PrintWriter;
import parser.symbols.ArrayDimensions;
import parser.symbols.ParserSymbol;

public final class Type extends ParserSymbol {
    private static final String STRING_IDENTIFIER = "TYPE";
    
    private final PrimitiveType primitiveType;
    private final ArrayDimensions dimensions;

    public Type(PrimitiveType primitiveType) {
        super(STRING_IDENTIFIER);
        this.primitiveType = primitiveType;
        this.dimensions = null;
    }

    public Type(PrimitiveType primitiveType, ArrayDimensions dimensions) {
        super(STRING_IDENTIFIER);
        this.primitiveType = primitiveType;
        this.dimensions = dimensions;
    }
    
    public boolean isArray() {
        return dimensions != null;
    }
    
    public boolean equals(Type t) {
        return t.primitiveType == primitiveType
                && (!t.isArray() && !isArray() 
                || t.dimensions.size() == this.dimensions.size()) ;
    }

    @Override
    public void validate() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void toDot(PrintWriter out) {
        DotNode dotNode = new DotNode(this, primitiveType.toString(), "box", "filled", "");
        
        if (isArray()) {
            dotNode.addEdge(dimensions);
        }
        dotNode.print(out);
        
        if (isArray()) dimensions.toDot(out);
    }
}
