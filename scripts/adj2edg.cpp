#include <bits/stdc++.h>
using namespace std;

vector <pair <int, int>> v;

int main() {
    std::ios::sync_with_stdio(false);

    int n, x;
    cin>>n;
    for(int i=1; i<=n; i++)
        for(int j=1; j<=n; j++) {
            cin>>x;
            if(x && i < j)
                v.push_back(make_pair(i, j));
        }

    cout<<n<<" "<<v.size()<<"\n";
    for(auto x:v)
        cout<<x.first<<" "<<x.second<<"\n";

    return 0;
}
