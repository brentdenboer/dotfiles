#compdef kubens kns=kubens
_kubens() {
  _arguments "1: :(- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}'))"
}
