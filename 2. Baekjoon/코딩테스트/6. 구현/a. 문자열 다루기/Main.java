import java.util.*;

public class Main {
    public static void main(String[] args) {
        String str = "Hello World";

        // 전체 출력
        System.out.println(str);

        // 부분 문자열 출력
        System.out.println(str.substring(0, 5));
        System.out.println(str.substring(1, 5));

        // 앞에서 3글자
        System.out.println(str.substring(0, 3));

        // 뒤에서 3글자
        System.out.println(str.substring(str.length() - 3));

        // 앞에서 2글자 제거(원본 유지)
        System.out.println(str.substring(2));

        // 뒤에서 2글자 제거(원본 유지)
        System.out.println(str.substring(0, str.length() - 2));

        // java String은 원본 변경 불가
        str = str.substring(2);                 // 앞에서 2글자 제거
        str = str.substring(0, str.length() - 2); // 뒤에서 2글자 제거

        // 문자열 뒤집기
        str = "Hello World"; // 원상 복구
        String reversedStr = new StringBuilder(str).reverse().toString();
        System.out.println(reversedStr);

        // 뒤집은 문자열 끝에 "Index" 추가
        System.out.println(reversedStr + " " + "Index");
    }
}