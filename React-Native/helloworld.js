import React from 'react';
import { Text, View, StyleSheet, Image } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <View style={styles.fillerContainer}></View>
      <View style={styles.titleContainer}>
        <Text style={styles.text}> Hello World! </Text>
        <Text style={styles.subtitle}>Introducing... Charmander</Text>
        <Image
          style={styles.profilePic}
          source={{
            uri:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWy1rhx6EXXOp-o6Jh89UM-FYySA8Ic34LFQ&usqp=CAU',
          }}
        />
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
    fontSize: 50,
    fontWeight: "bold",
    color: "white",
    textAlign: "center",
  },
  fillerContainer: {
    padding: 10,
    backgroundColor: "blue",
    flex: 0.25,
    width: "50%",
  },
  titleContainer: {
    backgroundColor: "orange",
    padding: 10,
    margin: 10,
    flex: 0.5,
    justifyContent: "center",
    borderRadius: "25px",
  },
  subtitle: {
    color: 'red',
    fontSize: 20,
    textAlign: 'center',
  },
  profilePic: {
    height: 120,
    width: 120,
    borderRadius: 60,
    alignSelf: 'center',
    marginTop: 10,
    borderColor: 'white',
    borderWidth: 2,
  },
});