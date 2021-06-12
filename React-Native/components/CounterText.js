import React from 'react';
import { StyleSheet, Text } from 'react-native';

export default function CounterText(props){
  console.log(props);
  return (
    <Text style={
      [styles.text,
        {
          color: props.color,
          fontSize: props.fontSize
        }
      ]}>
      {props.children}
      </Text>
  )
}

const styles=StyleSheet.create({
  text: {
    fontWeight: "bold"
  }
})