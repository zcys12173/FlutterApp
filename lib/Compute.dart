class Compute {
  bool needReset = false;
  String content = "";

  void onTextChanged({String text, Function onComputeFinish}) {
    if(needReset){
      content = "";
      needReset = false;
    }

    if (text == "C") {
      content = "";
      onComputeFinish(content);
      return;
    }

    if (text == "=") {
      content = _computeResult();
      onComputeFinish(content);
      needReset = true;
      return;
    }

    if(text == "." && !_isPointValid()){
      return;
    }
    if (content.length == 0) {
      if(!_isOperationChar(text)){
        content = text;
      }
    } else {
      String lastChar = content[content.length - 1];
      if (_isOperationChar(text)) {
        //输入的是操作符
        if (_isOperationChar(lastChar)) {
          content = content.substring(0, content.length - 1) + text;
          onComputeFinish(content);
          return;
        }else{
          if(content.contains("+")||content.contains("-")||content.contains("*")||content.contains("/")){
            content  = _computeResult();
          }
        }
      }
      content = content + text;

    }
    onComputeFinish(content);
  }

  bool _isOperationChar(String char) {
    return char == "+" ||
        char == "-" ||
        char == "*" ||
        char == "/" ||
        char == ".";
  }

  String _computeResult() {
    if (content.contains("+")) {
      return _sum().toString();
    } else if (content.contains("-")) {
      return _minus().toString();
    } else if (content.contains("*")) {
      return _multi().toString();
    } else if (content.contains("/")) {
      return _division().toString();
    }
    return content;
  }

  bool _isPointValid(){
    String s = content;
    if (content.contains("+")) {
      s = content.split("+")[1];
    } else if (content.contains("-")) {
      s = content.split("_")[1];
    } else if (content.contains("*")) {
      s = content.split("*")[1];
    } else if (content.contains("/")) {
      s = content.split("/")[1];
    }
    return !s.contains(".");
  }

  double _sum() {
    List<String> nums = content.split("+");
    return double.parse(nums[0]) + double.parse(nums[1]);
  }

  double _minus() {
    List<String> nums = content.split("-");
    return double.parse(nums[0]) - double.parse(nums[1]);
  }

  double _multi() {
    List<String> nums = content.split("*");
    return double.parse(nums[0]) * double.parse(nums[1]);
  }

  double _division() {
    List<String> nums = content.split("/");
    return double.parse(nums[0]) / double.parse(nums[1]);
  }
}
