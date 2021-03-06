// Messages
OscP5 oscP5;
NetAddress myRemoteLocation;
offsetBody = 1;

// ----------------------------------------------------------------------------
void oscSetup() {
  oscP5 = new OscP5(this, inPort);
  myRemoteLocation = new NetAddress(ip, outPort);
}

// ----------------------------------------------------------------------------
void sendData(int c) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/" + (c+offsetBody));

  myMessage.add(xPos);
  myMessage.add(xNeg);
  myMessage.add(yPos);
  myMessage.add(yNeg);

  //println(myMessage);

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

// ----------------------------------------------------------------------------
void sendData(int c, int m) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/" + (c+offsetBody));

  myMessage.add(xPos);
  myMessage.add(xNeg);
  myMessage.add(yPos);
  myMessage.add(yNeg);
  myMessage.add(m);

  println(myMessage);

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

// ----------------------------------------------------------------------------
void oscSendEmpty(int v) {
  OscMessage myMessage = new OscMessage("/" + (v+offsetBody));
  myMessage.add(0);
  myMessage.add(0);
  myMessage.add(0);
  myMessage.add(0);
  oscP5.send(myMessage, myRemoteLocation);
}

// ----------------------------------------------------------------------------
void oscSetupNull() {
  for (int i = 0; i < BODY_NUM; i++) {
    oscSendEmpty(i);
  }
}

// ----------------------------------------------------------------------------
void exit() {
  oscSetupNull();
}