add_clang_library(MLIRCIR
  CIRAttrs.cpp
  CIRDialect.cpp
  CIRTypes.cpp

  DEPENDS
  MLIRCIROpsIncGen

  LINK_LIBS PUBLIC
  MLIRIR
  MLIRDLTIDialect
  MLIRDataLayoutInterfaces
  MLIRFuncDialect
  MLIRCIRInterfaces
  clangAST
  )
