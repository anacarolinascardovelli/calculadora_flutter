class Memory {
  static const String OPERATIONS = "+-/X%=";
  
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  bool _operationUsed = false;
  String _opereation;

  String result = '0';
  String history = '';

  void applyCommand(String label) {
    
    if (label == 'AC') {
      _clear();
    } else if (OPERATIONS.contains(label)) {
      _setOperation(label);
    
    } else if (label == "DEL") {
      _deleteEndDigit();

    } else {
      _addDigit(label);
    }
  }

  _clear(){
    result = '0';
    history = '';
    _bufferIndex = 0;
    _operationUsed = false;
    _buffer.setAll(0,[0.0, 0.0]);
    _opereation = null;
  }

  _deleteEndDigit(){
    result = result.length == 1 ? '0':result.substring(0, result.length - 1);
  }
  _calculate(){
    switch(_opereation){
      case '+': return _buffer[0] + _buffer[1];
      case '-': return _buffer[0] - _buffer[1];
      case 'X': return _buffer[0] * _buffer[1];
      case '/': return _buffer[0] / _buffer[1];
      case '%': return _buffer[0] % _buffer[1];
    }

  }
  _setOperation(String operation){
    if (_bufferIndex == 0) {
      if (operation != '=') {
        _bufferIndex++;
      }
    } else {
      if (operation == '=' || !_operationUsed) {
        history = _buffer[0].toString().replaceAll('.0', '') + _opereation + _buffer[1].toString().replaceAll('.0', '');
        _buffer[0] = _calculate();
        result = _buffer[0].toString();
        result = result.endsWith('.0') ? result.replaceAll('.0', '') : result;
      }
    }
    _operationUsed = true;

    if (operation != '=') {
      _opereation = operation;
    }
  }

  _addDigit(String digit) {
    if (_operationUsed) result = '0';
    if (result == '0' && digit != '.') {
      result = '';
    }
    if (digit == '.' && result.contains('.')) {
      digit = '';
    }
    result += digit;
    _buffer[_bufferIndex] = double.parse(result);
    _operationUsed = false;
  }
}
