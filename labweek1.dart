import 'dart:io';
import 'dart:math';

void main() {
  print('Masukkan jumlah angka yang ingin di-generate: ');
  int? n = int.tryParse(stdin.readLineSync()!);

  // Generate angka random
  List<int> randomNumbers = generateRandomNumbers(n!);

  print('Pilih metode: (1) Bubble Sort (2) Inversi (3) Shuffle');
  int? choice = int.tryParse(stdin.readLineSync()!);

  Stopwatch stopwatch = Stopwatch()..start();

  // Pilih metode berdasarkan input
  Function? selectedFunction =
      {1: bubbleSort, 2: inversi, 3: shuffleList}[choice];

  selectedFunction?.call(randomNumbers);

  stopwatch.stop();
  print('Waktu eksekusi: ${stopwatch.elapsedMilliseconds} ms');

  print('Hasil: $randomNumbers');
}

List<int> generateRandomNumbers(int n) {
  Random random = Random();
  List<int> numbers = [];
  while (numbers.length < n) {
    numbers.add(random.nextInt(100)); // angka random antara 0-99
  }
  return numbers;
}

void bubbleSort(List<int> numbers) {
  int length = numbers.length;
  bool swapped;
  do {
    swapped = false;
    numbers.asMap().forEach((i, value) {
      if (i < length - 1 && numbers[i] > numbers[i + 1]) {
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        swapped = true;
      }
    });
  } while (swapped);
}

void inversi(List<int> numbers) {
  numbers.asMap().forEach((i, _) {
    if (i < numbers.length ~/ 2) {
      int temp = numbers[i];
      numbers[i] = numbers[numbers.length - 1 - i];
      numbers[numbers.length - 1 - i] = temp;
    }
  });
}

void shuffleList(List<int> numbers) {
  Random random = Random();
  numbers.asMap().forEach((i, _) {
    int randomIndex = random.nextInt(numbers.length);
    int temp = numbers[i];
    numbers[i] = numbers[randomIndex];
    numbers[randomIndex] = temp;
  });
}
