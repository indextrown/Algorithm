//#include <bits/stdc++.h>
#include <fstream>
#include <iostream>
#include <queue>
#include <vector>
using namespace std;

int N;

int cur_time = 0;
int idle_time = 0;

int ibuf;
string sbuf;

class Process {
public:
    queue<int> q;
    int io_fin_at = 0;

    Process() = default;

    explicit Process(const queue<int> &q) : q(q) {}
};

vector<Process> processes;

int main() {
    ifstream ifs("multi.inp");
    if (ifs.is_open()) {
        ifs >> N;
        processes.resize(N);
        int idx = 0;
        while (!ifs.eof()) {
            ifs >> ibuf;
            if (ibuf != -1) {
                processes[idx].q.push(ibuf);
            } else {
                idx++;
            }
        }
        ifs.close();
    }


    while (true) {
        bool all_processes_finished = true;
        for (const auto &p: processes) {
            if (!p.q.empty()) {
                all_processes_finished = false;
            }
        }
        if (all_processes_finished) {
            break;
        }

        bool cpu_worked = false;
        for (auto &p: processes) {
            if (!p.q.empty() && p.io_fin_at <= cur_time) {
                cpu_worked = true;
                cur_time += p.q.front();
                p.q.pop();
                if (!p.q.empty()) {
                    p.io_fin_at = cur_time + p.q.front();
                    p.q.pop();
                }
                break;
            }
        }
        if (!cpu_worked) {
            int move_to = 0x7f7f7f7f;
            for (const auto &p: processes) {
                if (!p.q.empty()) {
                    move_to = min(move_to, p.io_fin_at);
                }
            }
            idle_time += move_to - cur_time;
            cur_time = move_to;
        }
    }
    for (const auto &p: processes) {
        cur_time = max(cur_time, p.io_fin_at);
    }

    ofstream ofs("multi.out");
    if (ofs.is_open()) {
        ofs << idle_time << " " << cur_time;
        ofs.close();
    }
    return 0;
}
