import java.util.*;

public class Main {

    static <T> void permutation(List<T> arr, int r, int depth) {
        if (depth == r) {
            System.out.println(arr.subList(0, r));
            return;
        }

        for (int i = depth; i < arr.size(); i++) {
            Collections.swap(arr, i, depth);
            permutation(arr, r, depth + 1);
            Collections.swap(arr, i, depth);
        }
    }

    // 조합
    static <T> void combination(
            List<T> arr,
            List<T> selected,
            int r,
            int start
    ) {
        if (selected.size() == r) {
            System.out.println(selected);
            return;
        }

        for (int i = start; i < arr.size(); i++) {
            selected.add(arr.get(i));
            combination(arr, selected, r, i + 1);
            selected.remove(selected.size() - 1);
        }
    }
    
    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>(List.of(1, 2, 3));
        
        System.out.println("순열:");
        permutation(new ArrayList<>(list), 2, 0);

        System.out.println("\n조합:");
        combination(list, new ArrayList<>(), 2, 0);
    }
}
