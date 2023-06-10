// class ReceiveBLE {
//   static const int MAX_PACKET_BYTES = 20;
//   static const int MAX_PAYLOAD_BYTES = MAX_PACKET_BYTES - 1;
//   static const int LAST_PACKET_FLAG = 0x80;
//   static const int SEQUENCE_MASK = 0x60;
//   static const int LENGTH_MASK = 0x1f;
//
//   static const int MESSAGE_RECEIVED_OK = 0;
//   static const int MESSAGE_RECEIVED_LOST_PACKET = 0xFF;
//   static const int MESSAGE_RECEIVED_BAD_LENGTH = 0xFE;
//   static const int MESSAGE_RECEIVED_OVERFLOW = 0xFD;
//
//   static const int MAX_BUFFER_BYTES = 400;
//   static List<int> receiveMessage = List<int>.filled(MAX_BUFFER_BYTES, 0);
//   static int receiveMessageIndex = 0;
//   static int expectedPacketSequence = 0;
//
//   static void receivePacket(List<int> packet, FormClientBLE parentForm) {
//     int header = packet[0];
//     int sequence;
//     int length;
//
//     sequence = (header & SEQUENCE_MASK) >> 5;
//
//     if (sequence == expectedPacketSequence) {
//       length = header & LENGTH_MASK;
//       if (length <= MAX_PAYLOAD_BYTES) {
//         int bufferRemaining = MAX_BUFFER_BYTES - receiveMessageIndex;
//         if (length <= bufferRemaining) {
//           for (int i = 1; i < length + 1; i++) {
//             receiveMessage[receiveMessageIndex] = packet[i];
//             receiveMessageIndex++;
//           }
//           if ((header & LAST_PACKET_FLAG) != 0) {
//             parentForm.dispatchMessage(
//                 receiveMessage.sublist(0, receiveMessageIndex));
//             newMessageInit();
//           } else {
//             setNextPacketSequence(sequence);
//           }
//         } else {
//           // Lost packet, buffer overflow
//           parentForm.signalBadMessage(MESSAGE_RECEIVED_OVERFLOW);
//           newMessageInit();
//         }
//       } else {
//         // Lost packet, length is bad
//         parentForm.signalBadMessage(MESSAGE_RECEIVED_BAD_LENGTH);
//         newMessageInit();
//       }
//     } else {
//       // Lost packet, message is bad
//       parentForm.signalBadMessage(MESSAGE_RECEIVED_LOST_PACKET);
//       newMessageInit();
//     }
//   }
//
//   static void newMessageInit() {
//     receiveMessageIndex = 0;
//     expectedPacketSequence = 0;
//   }
//
//   static void setNextPacketSequence(int sequence) {
//     switch (sequence) {
//       case 0:
//         expectedPacketSequence = 1;
//         break;
//       case 1:
//         expectedPacketSequence = 2;
//         break;
//       case 2:
//         expectedPacketSequence = 3;
//         break;
//       case 3:
//         expectedPacketSequence = 1;
//         break;
//       default:
//         expectedPacketSequence = 0;
//         break;
//     }
//   }
// }
//
// class FormClientBLE {
//   void dispatchMessage(List<int> message) {
//     // Implementation of dispatchMessage method
//   }
//
//   void signalBadMessage(int errorCode) {
//     // Implementation of signalBadMessage method
//   }
// }
