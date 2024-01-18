class ModelControl {
  Map<String, String>? listcontrol(modelo) {
    if (modelo == 'projector') {
      return {
        "power": "BD807F",
        "mute": "BD56A9",
        "up": "BDD02F",
        "dow": "BDF00F",
        "left": "BD926D",
        "rigth": "BD52AD",
        "enter": "BDB04F",
        "return": "BD2AD5",
        "menu": "BD50AF",
        "input": "BD20DF",
        "voldow": "BD08F7",
        "volup": "BD30CF",
        "hdmi1": "1FEA05F",
        "hdmi2": "1FEE01F",
        "hdmi3": "1FE10EF",
      };
    }

    if (modelo == 'haroku') {
      return {
        'back': '57436798',
        'home': '5743C13E',
        'up': '57439867',
        'dow': '5743CC33',
        'left': '57437887',
        'rigth': '5743B44B',
        'enter': '574355AA',
        'return': '57431FE0',
        'asterisk': '57438778',
        'advancedleft': '57432CD3',
        'play': '574332CD',
        'advancedrigth': '5743AA55',
      };
    }
    return null;
  }
}
