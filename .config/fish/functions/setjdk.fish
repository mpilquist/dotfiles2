function setjdk
  fenv (cs java --jvm $argv[1] --env)
end

