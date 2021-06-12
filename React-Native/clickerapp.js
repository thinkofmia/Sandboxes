import React, { useState } from 'react';
import { StyleSheet, Text, View, Button, TouchableOpacity } from 'react-native';

export default function App() {

  let [count, setCount] = useState(0);

  function buttonPressed(){
    console.log(`You poked me! Owwie. Before pressing, the count was ${count}`);
    setCount(count+1);
  }

  function buttonUnpressed(){
    setCount(count-1);
  }

  function buttonReset(){
    setCount(0);
  }

  function renderEncouragingText(){
    if (count>=30){
      return "Aren't you tired?";
    }
    else if (count>=20){
      return "Owww, I think thats enough!";
    }
    else if (count>=10){
      return "Keep Going!";
    }
  }

  return (
    <View style={styles.container}>
      <Text style={styles.counter}>{count}</Text>
      <TouchableOpacity onPress={buttonPressed} style={styles.button}>
        <Text style={styles.buttonText}>Click Meeee!</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={buttonUnpressed} style={styles.button}>
        <Text style={styles.buttonText}>Unclick me?</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={buttonReset} style={styles.unclickbutton}>
        <Text style={styles.buttonText}>Reset multiverse</Text>
      </TouchableOpacity>
      <Text style={styles.encouragingText}>{renderEncouragingText()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'darkgray',
    alignItems: 'center',
    justifyContent: 'center',
  },
  counter: {
    fontWeight: "bold",
    fontSize: 20,
    color: "red"
  },
  encouragingText: {
    margin: 50,
    backgroundColor: "orange",
    color: "white",
    padding: 10,
    borderRadius: 20,
  },
  button: {
    margin: 10,
    backgroundColor: "goldenrod",
    padding: 20,
    borderRadius: 20,
  },
  unclickbutton: {
    margin: 10,
    backgroundColor: "red",
    padding: 20,
    borderRadius: 20,
  },
  buttonText:{
    color: "white",
    fontWeight: "bold",
    fontStyle: 40
  }
});