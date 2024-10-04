class PriorityQueue {
    constructor() {
        this.values = [];
    }

    enqueue(val, priority) {
        this.values.push({ val, priority });
        this.sort();
    }

    dequeue() {
        return this.values.shift();
    }

    sort() {
        this.values.sort((a, b) => a.priority - b.priority);
    }
}

const dijkstra = (n, start, graph) => {
    const distances = Array(n).fill(Infinity);
    distances[start] = 0;
    const pq = new PriorityQueue();
    pq.enqueue(start, 0);

    while (pq.values.length) {
        const { val: node } = pq.dequeue();

        graph[node].forEach(([neighbor, weight]) => {
            const dist = distances[node] + weight;
            if (dist < distances[neighbor]) {
                distances[neighbor] = dist;
                pq.enqueue(neighbor, dist);
            }
        });
    }

    return distances;
};

function solution(n, s, a, b, fares) {
    const graph = Array.from({ length: n }, () => []);

    fares.forEach(([u, v, w]) => {
        graph[u - 1].push([v - 1, w]);
        graph[v - 1].push([u - 1, w]);
    });

    const distFromStart = dijkstra(n, s - 1, graph);
    const distFromA = dijkstra(n, a - 1, graph);
    const distFromB = dijkstra(n, b - 1, graph);

    let minFare = Infinity;

    for (let i = 0; i < n; i++) {
        minFare = Math.min(minFare, distFromStart[i] + distFromA[i] + distFromB[i]);
    }

    return minFare;
}
