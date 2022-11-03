import 'package:agrify/model/disease/data_model.dart';
import 'package:flutter/foundation.dart';

class DiseaseModel {
  recognizeDisease(String name, Uint8List? image) {
    switch (name) {
      case 'tomato':
        return DataModel(
          diseaseName: 'Tomato Spot Disease',
          causes: ['Septoria leaf spot', 'bacterial spot', 'and early blight.'],
          treatment: [
            'Pinch off leaves with leaf spots and bury them in the compost pile.',
            'It is okay to remove up to a third of the plant\'s leaves if you catch the disease early.',
            'Do not remove more than a third of the plant\'s leaves.',
            'Keep leaves dry to reduce spreading the disease.'
          ],
          prevention: [
            'Cover the soil below the tomato plants with mulch.',
            'Water the soil not the leaves.',
            'Stake or trellis your tomatoes.',
            'Don\'t work in tomato plants when the leaves are wet. '
          ],
        );
      case 'Tomato':
        return DataModel(diseaseName: 'Healthy');
    }
  }
}
