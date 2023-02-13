
return {
  cmd = { 'dart',  'language-server', '--client-id vim', '--packages ~/app/dcp-flutter/.pub_cache'},
  init_options = {
      onlyAnalyzeProjectsWithOpenFiles = "true",
      suggestFromUnimportedLibraries = "true",
      closingLabels = "true",
      outline = "false",
      fluttreOutline= "false"
    };
}
