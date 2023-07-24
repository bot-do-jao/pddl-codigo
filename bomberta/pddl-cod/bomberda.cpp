#include <bits/stdc++.h>

using namespace std;

void generateDomain()
{

    ofstream MyFile("/tmp/domain.pddl");

    MyFile << "(define (domain bomb)\n";
    MyFile << "(:requirements :strips :typing :negative-preconditions :conditional-effects :disjunctive-preconditions)\n";
    MyFile << "(:types\n";
    MyFile << "   position player bomb direction\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:constants\n";
    MyFile << "   up down left right - direction\n";
    MyFile << "\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:predicates\n";
    MyFile << "   (player-at ?pos - position)\n";
    MyFile << "   (treasure-at ?pos - position)\n";
    MyFile << "   (bomb-at ?pos - position)\n";
    MyFile << "   (enemy-at ?pos - position)\n";
    MyFile << "   (box-at ?pos - position)\n";
    MyFile << "   (fragile-floor-at ?pos - position)\n";
    MyFile << "   (collapsed-floor-at ?pos - position)\n";
    MyFile << "   (has-bomb ?p - player)\n";
    MyFile << "   (valid-move ?from - position ?to - position)\n";
    MyFile << "   (adjacent ?pos - position ?adj - position ?dir - direction)\n";
    MyFile << "   (win ?p - player)\n";
    MyFile << "   (second-state ?b - bomb )\n";
    MyFile << "   (blast-state ?b - bomb )\n";
    MyFile << "   (lose ?p - player)\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:action pick-treasure\n";
    MyFile << "   :parameters (?p - player ?pos - position)\n";
    MyFile << "   :precondition (and (player-at ?pos) (treasure-at ?pos))\n";
    MyFile << "   :effect (and (not (treasure-at ?pos)) (win ?p))\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:action SOLTARBOMBA\n";
    MyFile << "   :parameters (?pos - position ?bomb - bomb ?p - player)\n";
    MyFile << "   :precondition (and (player-at ?pos) (not (bomb-at ?pos)) (not (enemy-at ?pos)) (not (has-bomb ?p)))\n";
    MyFile << "   :effect (and (bomb-at ?pos)\n";
    MyFile << "       (second-state ?bomb )\n";
    MyFile << "       (has-bomb ?p))\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:action CIMA\n";
    MyFile << "   :parameters (?from_p ?to_p ?from_e ?to_e - position)\n";
    MyFile << "   :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p)\n";
    MyFile << "       (enemy-at ?from_e) (adjacent ?from_p ?to_p up) (adjacent ?from_e ?to_e down)\n";
    MyFile << "       (not (= ?to_e ?to_p))\n";
    MyFile << "       (not (enemy-at ?to_p)))\n";
    MyFile << "   :effect (and\n";
    MyFile << "       (not (player-at ?from_p))\n";
    MyFile << "       (player-at ?to_p)\n";
    MyFile << "       (not (enemy-at ?from_e))\n";
    MyFile << "       (enemy-at ?to_e)\n";
    MyFile << "   )\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:action BAIXO\n";
    MyFile << "   :parameters (?from_p ?to_p ?from_e ?to_e - position)\n";
    MyFile << "   :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p)\n";
    MyFile << "       (not (= ?to_e ?to_p))\n";
    MyFile << "       (enemy-at ?from_e) (not (enemy-at ?to_p)) (adjacent ?from_p ?to_p down) (adjacent ?from_e ?to_e up))\n";
    MyFile << "   :effect (and\n";
    MyFile << "       (not (player-at ?from_p))\n";
    MyFile << "       (player-at ?to_p)\n";
    MyFile << "       (not (enemy-at ?from_e))\n";
    MyFile << "       (enemy-at ?to_e)\n";
    MyFile << "   )\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:action ESQUERDA\n";
    MyFile << "   :parameters (?from_p ?to_p ?from_e ?to_e - position)\n";
    MyFile << "   :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p)\n";
    MyFile << "       (not (= ?to_e ?to_p))\n";
    MyFile << "       (enemy-at ?from_e) (not (enemy-at ?to_p)) (adjacent ?from_p ?to_p left) (adjacent ?from_e ?to_e right))\n";
    MyFile << "   :effect (and\n";
    MyFile << "       (not (player-at ?from_p))\n";
    MyFile << "       (player-at ?to_p)\n";
    MyFile << "       (not (enemy-at ?from_e))\n";
    MyFile << "       (enemy-at ?to_e)\n";
    MyFile << "   )\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:action DIREITA\n";
    MyFile << "   :parameters (?from_p ?to_p ?from_e ?to_e - position)\n";
    MyFile << "   :precondition (and\n";
    MyFile << "       (player-at ?from_p) (valid-move ?from_p ?to_p)\n";
    MyFile << "       (not (= ?to_e ?to_p))\n";
    MyFile << "       (enemy-at ?from_e) (not (enemy-at ?to_p)) (adjacent ?from_p ?to_p right) (adjacent ?from_e ?to_e left))\n";
    MyFile << "   :effect (and\n";
    MyFile << "       (not (player-at ?from_p))\n";
    MyFile << "       (player-at ?to_p)\n";
    MyFile << "       (not (enemy-at ?from_e))\n";
    MyFile << "       (enemy-at ?to_e)\n";
    MyFile << "   )\n";
    MyFile << ")\n";
    MyFile << "\n";
    MyFile << "(:action bomb-turn-two\n";
    MyFile << "   :parameters (?pos - position ?bomb - bomb)\n";
    MyFile << "   :precondition (and (bomb-at ?pos) (second-state ?bomb))\n";
    MyFile << "   :effect ( blast-state ?bomb)\n";
    MyFile << ")\n";
    MyFile << "(:action bomb-explode\n";
    MyFile << "   :parameters (?pos ?adj1 ?adj2 ?adj3 ?adj4 - position ?bomb - bomb ?p - player)\n";
    MyFile << "   :precondition (and (bomb-at ?pos) (blast-state ?bomb s3)\n";
    MyFile << "       (adjacent ?pos ?adj1 up) (adjacent ?pos ?adj2 down)\n";
    MyFile << "       (adjacent ?pos ?adj3 left) (adjacent ?pos ?adj4 right))\n";
    MyFile << "   :effect (or\n";
    MyFile << "    (when \n";
    MyFile << "                (player-at ?adj1) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (lose ?p))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (player-at ?adj2) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (lose ?p))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (player-at ?adj3) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (lose ?p))\n";
    MyFile << "            )\n";
    MyFile << "            (when \n";
    MyFile << "                (player-at ?adj4) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (lose ?p))\n";
    MyFile << "            )\n";
    MyFile << "            (when \n";
    MyFile << "                (player-at ?pos) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (lose ?p))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (box-at ?adj1) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (box-at ?adj1)) (valid-move ?pos ?adj1) (valid-move ?adj1 ?pos))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (box-at ?adj2) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (box-at ?adj2)) (valid-move ?pos ?adj2) (valid-move ?adj2 ?pos))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (box-at ?adj3) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (box-at ?adj3)) (valid-move ?pos ?adj3) (valid-move ?adj3 ?pos))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (box-at ?adj4) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (box-at ?adj4)) (valid-move ?pos ?adj4) (valid-move ?adj4 ?pos))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (fragile-floor-at ?adj1) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (valid-move ?pos ?adj1)) (not (valid-move ?adj1 ?pos))\n";
    MyFile << "                (collapsed-floor-at ?adj1))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (fragile-floor-at ?adj2) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (valid-move ?pos ?adj2)) (not (valid-move ?adj2 ?pos))\n";
    MyFile << "                (collapsed-floor-at ?adj2))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (fragile-floor-at ?adj3) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (valid-move ?pos ?adj3)) (not (valid-move ?adj3 ?pos))\n";
    MyFile << "                (collapsed-floor-at ?adj3))\n";
    MyFile << "            )\n";
    MyFile << "\n";
    MyFile << "            (when \n";
    MyFile << "                (fragile-floor-at ?adj4) \n";
    MyFile << "                (and (not (has-bomb ?p)) (not (bomb-at ?pos)) (not (valid-move ?pos ?adj4)) (not (valid-move ?adj4 ?pos))\n";
    MyFile << "                (collapsed-floor-at ?adj4))\n";
    MyFile << "            )\n";
    MyFile << "   )\n";
    MyFile << ")\n";
    MyFile << "(:action floor-collapse\n";
    MyFile << "   :parameters (?from ?to - position)\n";
    MyFile << "   :precondition (and (player-at ?to) (not (player-at ?from)) (fragile-floor-at ?from))\n";
    MyFile << "   :effect (and (collapsed-floor-at ?from)\n";
    MyFile << "       (not (valid-move ?from ?to))\n";
    MyFile << "       (not (valid-move ?to ?from))\n";
    MyFile << "   )\n";
    MyFile << ")\n";
    MyFile << ")\n";

    MyFile.close();
}

void generateMap(char *path)
{
    string text;
    vector<string> vet;
    int enemy = 0;

    ifstream MyReadFile(path);

    while (getline(MyReadFile, text))
    {
        vet.push_back(text);
    }
    MyReadFile.close();

    ofstream MyFile("/tmp/mapa.pddl");

    MyFile << "(define (problem bomb-problem)\n";
    MyFile << "  (:domain bomb)\n";
    MyFile << "  (:objects\n";
    MyFile << "    player1 - player\n";
    MyFile << "    bomba - bomb\n";

    string aux = "    ";
    for (int i = 0; i < vet.size(); i++)
    {
        for (int j = 0; j < vet[i].size(); j++)
        {
            // cout << "p" + to_string(j) + "x" + to_string(i) + "y" + " \n";
            aux += "p" + to_string(j) + "x" + to_string(i) + "y" + " ";
            if (vet[i][j] == 'E')
                enemy++;
        }
    }
    if (enemy == 0)
    {
        aux += "p99x99y p98x99y ";
    }
    aux += "- position\n";

    MyFile << aux;
    MyFile << "  )\n";
    MyFile << "  (:init\n";

    for (int i = 0; i < vet.size(); i++)
    {
        for (int j = 0; j < vet[i].size(); j++)
        {
            switch (vet[i][j])
            {
            case '@': // player
                MyFile << "    (player-at p" + to_string(j) + "x" + to_string(i) + "y)\n";
                break;
            case ' ': // floor
                break;
            case 'x': // fragille
                MyFile << "    (fragile-floor-at p" + to_string(j) + "x" + to_string(i) + "y)\n";
                break;
            case 'X': // collapsed
                MyFile << "    (collapsed-floor-at p" + to_string(j) + "x" + to_string(i) + "y)\n";
                break;
            case '$': // box
                MyFile << "    (box-at p" + to_string(j) + "x" + to_string(i) + "y)\n";
                break;
            case 'E': // enemy
                MyFile << "    (enemy-at p" + to_string(j) + "x" + to_string(i) + "y)\n";
                enemy++;
                break;
            case '.': // treasure
                MyFile << "    (treasure-at p" + to_string(j) + "x" + to_string(i) + "y)\n";
                break;
            case '#': // wall
                break;
            default:
                break;
            }

            if (i - 1 > 0)
            {
                MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i - 1) + "y up)\n";
            }
            if (i + 1 < vet.size() - 1)
            {
                MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i + 1) + "y down)\n";
            }
            if (j - 1 > 0)
            {
                MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j - 1) + "x" + to_string(i) + "y left)\n";
            }
            if (j + 1 < vet[i].size() - 1)
            {
                MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j + 1) + "x" + to_string(i) + "y right)\n";
            }

            if (vet[i][j] != 'X' and vet[i][j] != '$' and vet[i][j] != '#')
            {
                if (i - 1 > 0)
                {
                    if (vet[i - 1][j] != 'X' and vet[i - 1][j] != '$' and vet[i - 1][j] != '#')
                    {
                        MyFile << "    (valid-move p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i - 1) + "y)\n";
                    }
                    else
                    {
                        MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i) + "y up)\n";
                    }
                }
                if (i + 1 < vet.size() - 1)
                {
                    if (vet[i + 1][j] != 'X' and vet[i + 1][j] != '$' and vet[i + 1][j] != '#')
                    {
                        MyFile << "    (valid-move p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i + 1) + "y)\n";
                    }
                    else
                    {
                        MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i) + "y down)\n";
                    }
                }
                if (j - 1 > 0)
                {
                    if (vet[i][j - 1] != 'X' and vet[i][j - 1] != '$' and vet[i][j - 1] != '#')
                    {
                        MyFile << "    (valid-move p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j - 1) + "x" + to_string(i) + "y)\n";
                    }
                    else
                    {
                        MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i) + "y left)\n";
                    }
                }
                if (j + 1 < vet[i].size() - 1)
                {
                    if (vet[i][j + 1] != 'X' and vet[i][j + 1] != '$' and vet[i][j + 1] != '#')
                    {
                        MyFile << "    (valid-move p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j + 1) + "x" + to_string(i) + "y)\n";
                    }
                    else
                    {
                        MyFile << "    (adjacent p" + to_string(j) + "x" + to_string(i) + "y p" + to_string(j) + "x" + to_string(i) + "y right)\n";
                    }
                }
            }
        }
    }

    if (enemy == 0)
    {
        MyFile << "    (enemy-at p99x99y)\n";
        MyFile << "    (adjacent p99x99y p98x99y up)\n";
        MyFile << "    (adjacent p99x99y p98x99y down)\n";
        MyFile << "    (adjacent p99x99y p98x99y left)\n";
        MyFile << "    (adjacent p99x99y p98x99y right)\n";
        MyFile << "    (adjacent p98x99y p99x99y up)\n";
        MyFile << "    (adjacent p98x99y p99x99y down)\n";
        MyFile << "    (adjacent p98x99y p99x99y left)\n";
        MyFile << "    (adjacent p98x99y p99x99y right)\n";
    }
    MyFile << "  )\n";
    MyFile << "  (:goal (and\n";
    MyFile << "      (win player1) (not(lose player1)))\n";
    MyFile << "  )\n";
    MyFile << ")\n";
    MyFile.close();
}

int main(int argc, char **argv)
{

    generateDomain();
    generateMap(argv[1]);

    cout << "downward/fast-downward.py --alias lama-first";
    // cout << "madagascar/Mp";
    // cout << "julia/planner.jl";
    return 0;
}