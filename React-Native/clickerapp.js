import React, { useState } from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';

export default function App() {

  let [count, setCount] = useState(0);

  function buttonPressed(){
    alert(`You poked me! Owwie. Before pressing, the count was ${count}`);
    setCount(count+1);
  }

  return (
    <View style={styles.container}>
      <Text>{count}</Text>
      <Button title='Press Me!' onPress={buttonPressed} ></Button>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});