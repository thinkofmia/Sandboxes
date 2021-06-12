import React from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';

export default function App() {

  function buttonPressed(){
    alert('You poked me! Owwie.');
  }

  return (
    <View style={styles.container}>
      <Text>Open up App.js to start working on your app!</Text>
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