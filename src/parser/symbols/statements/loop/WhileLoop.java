package parser.symbols.statements.loop;

import java.io.PrintWriter;
import parser.symbols.SymbolList;
import parser.symbols.expressions.Expression;
import parser.symbols.statements.Statement;

public final class WhileLoop extends Loop {

    public WhileLoop(Expression condition, SymbolList<Statement> statements) {
        super(condition, statements);
    }

    @Override
    public void validate() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void toDot(PrintWriter out) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}