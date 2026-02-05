import java.io.*;
import java.util.*;

public class Main {
    public static void main(String args[]) throws Exception {
        // freopen
        System.setIn(new FileInputStream("input.txt"));

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        int arr[] = new int[n+1];
        st = new StringTokenizer(br.readLine());
        for (int i=1; i<=n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        int psum[] = new int[n+1];
        for (int i=1; i<=n; i++) {
            psum[i] = psum[i-1] + arr[i];
        }

        StringBuilder sb = new StringBuilder();
        for (int i=0; i<m; i++) {
            st = new StringTokenizer(br.readLine());
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());

            // System.out.println(psum[b] - psum[a-1]);
            sb.append(psum[b] - psum[a-1]).append("\n");
        }
        System.out.println(sb);
    }
}

