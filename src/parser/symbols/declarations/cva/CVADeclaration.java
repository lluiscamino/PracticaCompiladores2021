package parser.symbols.declarations.cva;

import main.Compiler;
import parser.symbols.declarations.Declaration;
import parser.symbols.declarations.DeclarationMode;
import parser.symbols.expressions.Expression;
import parser.symbols.types.Type;
import symboltable.SymbolTable;
import tac.generators.TACVariableGenerator;
import tac.instructions.arithmetic.CopyInstruction;
import tac.references.TACVariable;

public abstract class CVADeclaration extends Declaration {
    protected final Type type;
    protected final DeclarationMode mode;
    protected Expression expression;
    
    public CVADeclaration(DeclarationMode mode, Type type, String identifier) {
        super(identifier, mode.xleft);
        this.mode = mode;
        this.type = type;
        this.expression = null;
    }

    public CVADeclaration(DeclarationMode mode, Type type, String identifier, Expression expression) {
        super(identifier, mode.xleft);
        this.mode = mode;
        this.type = type;
        this.expression = expression;
    }

    public Type getType() {
        return type;
    }

    public DeclarationMode getMode() {
        return mode;
    }
    
    public boolean hasAssociatedValue() {
        return expression != null;
    }
    
    public void setAssociatedValue(Expression expression) {
        this.expression = expression;
    }
    
    @Override
    public void validate() {
        SymbolTable symbolTable = Compiler.getCompiler().getSemanticAnalyzer().getSymbolTable();
        if (mode.isConstant() && expression == null) {
            addSemanticError("La declaración de la constante " + identifier + " no tiene ningun valor asociado");
        }
        if (expression != null) {
            Type exprType = expression.getType();
            if (!type.isUnknown() && !exprType.isUnknown() && !type.equals(exprType)) {
                addSemanticError("No se puede asignar un valor de tipo " + exprType + " a una variable de tipo " + type);
            }
            expression.validate();
        }
        if (!symbolTable.isInInitialScope() && !symbolTable.put(this)) {
            addSemanticError(identifier + " ya ha sido definido previamente");
        }
    }


    @Override
    public void toTac() {
        SymbolTable symbolTable = Compiler.getCompiler().getSemanticAnalyzer().getSymbolTable();
        TACVariableGenerator variableGenerator = Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();

        symbolTable.put(this);
        TACVariable variable = variableGenerator.generate(identifier, type, false);
        if (expression == null) {
            expression = type.defaultExpression();
        }
        expression.toTac();
        addTACInstruction(new CopyInstruction(variable, expression.getTacVariable()));
    }
    
    @Override
    public String toString() {
        int lineNum = xleft != null ? xleft.getLine() : -1;
        return lineNum + ": " + mode + " " + type + " " + identifier;
    }
}
