# Onboading Stuff
- IBM Onboarding
	- [?] Welcom Session (scheduled)
	- [ ] Internship Journey (modules)
	- [ ] Meet with Manager? ("Internship Blueprint"???)
	- [ ] Internship Guide
		- [x] SAP Login (Currently don't have access)
		- [x] VPN

- IBM Bob
	- [?] Request for IBM Bob (from slack)
	- [?] Ask Manager for IBM BOB (from tiger onboarding)



- Orchestration Onboarding (refer to alan slack channel; lowkey not sure if i need to all this... for alans group)
	- [ ] Day 1 Onboarding
		- [x] Github
		- [ ] wxo get started video
		- [ ] wxo tenant access
		- [x] wxo lab
		- [ ] wxo video tutorials (5 total)
		- [ ] wxo documetation
	- [ ] Day 2 Onboarding
		- [ ] 1. UI Automation Learning (bunch of vidoes)
		- [ ] 2. Getting started
		- [ ] 3. API Automation
		- [ ] 4. Architecture
		- [ ] 5. Reference
	- [ ] Day 3
		- [ ] 

- Tiger Onboarding
	- [?] Access Requests (mostly, were told to ignore some)
	- [x] Github Repos 
	- [x] Slack Channels
	- [?] Monday Boards (requested)
	- [ ] Training
		- [ ] ADK/CLI
		- [ ] 






# Learning
- IBM Company Stuff
	- Seems like IBM has positioned itself to be two things:
		- Hybrid Cloud
		- AI "Platform"
	- [ ] OpenShift
	- [ ] Redhat
	- [ ] Kubernetes, Prometheus, Jenkins, ....
	- ....Ngl also into containerizatin and how it works.... like how linux supports this in the first place. 
- [ ] Python Dev
	- [ ] Python as a whole
	- [ ] UV -- seems like a really good upgrade to pip
	- [ ] Poetry
	- [ ] Pants

- [ ] Other stuff
	- [ ] Langchain
	- [ ] Langgraph
	- [ ] Redis cache
	- [ ] Grafana
	- [ ] Instana
	- [ ] Argo Cd

- [ ] "Agent Orhcestration"
	- Rag
	- Agent pipelines or how the main agent interfaces with the others
	- Why Yaml? ( as opposed to a json or something)
	-  





-----
Random Notes on meeting 6/1/26 (jian; agents?)
- What is an agent? 
	- Effectively a lllm that a user interacts with via some sort of chat interface in order to "orchestrate" multiple other agents. 
	- These other agents are spec'ed to a certain task, context, etc. 
	- 
- Using uv... he provided a link to some github that contains some stuff
	- Quick lil demo for how to get the dependencies/venv using uv

- the github has some demo... including demo env variables... we will need to get those eventually for esaaad team work. 
- This effectively launches a localhost version of the chat interface that you've already seen. 
- Peep lima (a shell environment) `limactl shell ibm-watsonx-orchestrate`	- looks like a way to remote access a shell which contains all the containers "needed"? (Not sure 'what' is needed in order to do 'what'.


- Anywho, all the above stuff is how to develop/demo locally. 
- For the rest of the thing we will use aws. 
	- There is a api key linkedin to our orchestrate account (visit https://dl.watson-orchestrate.ibm.com/chat)... there is a settings that enables you to setup your api key. 
	- SAVE THE API KEY SOMEWHERE!


- Anyways it looks like you will effecgively link the cloud based orchestrate to your local environemtn... lots of commands to become familiar with here. 

This guy is a vim user w!

- Atp this was setting up local stuff (this time linked to the cloudv version). 

- NOW we are adding agents and shi.

- `agent.yaml` specifies some config for the agent we want to download
	- What the underlying model is, the style, a name, etc. 
	- Agent description
		- when specifying agents/tools, this should be done from the bottom up. So when imagingin g a tree of the workflow, import the bottom most ones first. 

	- `orchestrate agents` is how to get commands from orchestrate based off agents... like importing, creating, etc. 
	- in the demo, we care about `orchestrate agent import -f <path_of_yaml_file`
	- 

- NOW WE ARE TALKING ABOUT TOOLS....	
	- tf is a tool... apparently Azeem likes to use python to build tools...
	- How do llms do "tool callign"...
		- LLM reasons that it needs a tool... in order to decided that, the LLM actually refers to the docstring for the tool; this means that the docstring specifying the function handle (args and return) is very important. 

	- Once a tool is created, you can import it via a terminal command like `orchestrate tool ....`
	- However you're not done, you need to link the tool to the agent, this is done in the agent.yaml file. 
	- Probably should mention the tools existence in the agent.yaml "instruction" section. 
	- Now going to the web ui, we see that the tool is there... after importing the agent. 
	- 


> So can i think of tools as a determinstic way to add context/insructions to an LLM? Since the tool is a.




> aside, look into "toolkits"... used for MCP stuff?
> Tools can be of type openapi, python, flow, langflow...?
> 


Example of a "tool":
```python
from ibm_watsonx_orchestrate.agent_builder.tools import tool

@tool() # relevant decorator for python
def func() 
	"""
	Docstring for the LLM
	"""
	// do something


```

Something from the chat in the meeting:
``
instance url:

https://dev296776.service-now.com



user name:



admin 



password:



3$MvDl2Ozm/I

```
