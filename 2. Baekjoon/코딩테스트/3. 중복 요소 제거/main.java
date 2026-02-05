import java.util.*;

public class Main {
    public static void main(String args[]) {

        int arr[] = {2, 2, 1, 1, 3, 3, 2, 3};

        // 1. Map 사용 (비효율)
        Map<Integer, Integer> map = new HashMap<>();
        for (int i : arr) {
            if (!map.containsKey(i)) {
                map.put(i, map.getOrDefault(i, 0) + 1);
            }
        }

        List<Integer> keys = new ArrayList<>(map.keySet());
        Collections.sort(keys);

        for (int key : keys) {
            System.out.println(key);
        }

        // 2. set
        Set<Integer> set = new HashSet<>();
        for (int num: arr) {
            set.add(num);
        }

        List<Integer> result = new ArrayList<>(set);
        Collections.sort(result);
        for (int num: result) {
            System.out.println(num);
        }

        // 3. treeset
        Set<Integer> treeset = new TreeSet<>();
        for (int num: arr) {
            treeset.add(num);   
        }

        for (int num: treeset) {
            System.out.println(num);
        }
    }
}