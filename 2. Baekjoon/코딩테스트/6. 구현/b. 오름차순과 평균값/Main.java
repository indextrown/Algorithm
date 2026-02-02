import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        System.setIn(new FileInputStream("input.txt"));

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // 첫 줄 입력
        int n = Integer.parseInt(br.readLine());

        // 두번째 줄 배열 입력 1
        // int arr[] = Arrays.stream(br.readLine().split(" "))
        //                   .mapToInt(Integer::parseInt)
        //                   .toArray();

        // 두번쨰 줄 배열 입력 2
        StringTokenizer st = new StringTokenizer(br.readLine());
        int arr[] = new int[n];
        for (int i=0; i<n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        // 평균 계산
        int sum = 0;
        for (int x: arr) sum += x;
        double avg = (double) sum / arr.length;

        // 내림차순 정렬 1
        // Integer[] boxed = Arrays.stream(arr).boxed().toArray(Integer[]::new);
        // Arrays.sort(boxed, Collections.reverseOrder());

        // 내림차순 정렬 2
        Arrays.sort(arr);
        for (int i = arr.length - 1; i >= 0; i--) {
            System.out.print(arr[i] + " ");
        }
        
        System.out.printf("\n%.2f%n", avg);
    }
}