using LanguageServer;
using Pkg;
import StaticLint;
import SymbolServer;
server = LanguageServer.LanguageServerInstance(stdin, stdout, "", "");
server.runlinter = false;
run(server);
