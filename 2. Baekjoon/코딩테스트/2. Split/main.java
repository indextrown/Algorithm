import java.util.*;

public class Main {
    public static void main(String args[]) {
        String str = "apple->banana->cherry->grape";
        String result[] = str.split("->");
        System.out.println(Arrays.toString(result));
    }
}