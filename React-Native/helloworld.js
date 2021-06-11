import React from 'react';
import { Text, View, StyleSheet } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <View style={styles.fillerContainer}></View>
      <View style={styles.titleContainer}>
        <Text style={styles.text}> Hello World! </Text>
      </View>      
      <View style={styles.fillerContainer}></View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: "goldenrod"
  },
  text : {
    fontSize: 60,
    fontWeight: "bold",
    color: "white",
    textAlign: "center",
  },
});